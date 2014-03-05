// FakeConnection.m
//
// Copyright (c) 2014 林藍東
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "FakeConnection.h"

@implementation FakeConnection {
    NSArray *_tables;
    NSDictionary *_columns;
    NSDictionary *_columnMaps;
    NSDictionary *_primaryKeys;
}

- (instancetype)init
{
    if ((self = [super init])) {
        _columns = @{
            @"users": @[
                 [[ARELColumn alloc] initWithName:@"id"         type:ARELColumnTypeInteger],
                 [[ARELColumn alloc] initWithName:@"name"       type:ARELColumnTypeString],
                 [[ARELColumn alloc] initWithName:@"bool"       type:ARELColumnTypeBoolean],
                 [[ARELColumn alloc] initWithName:@"created_at" type:ARELColumnTypeDate]
             ],
             @"products": @[
                 [[ARELColumn alloc] initWithName:@"id"         type:ARELColumnTypeInteger],
                 [[ARELColumn alloc] initWithName:@"price"      type:ARELColumnTypeDecimal],
             ]
        };
        
        _columnMaps = ({
            NSMutableDictionary *map = [NSMutableDictionary dictionary];
            id enumBlock = ^ (ARELColumn *col, NSUInteger idx, BOOL *stop) {
                map[col.name] = col;
            };
            [_columns[@"users"] enumerateObjectsUsingBlock:enumBlock];
            [_columns[@"products"] enumerateObjectsUsingBlock:enumBlock];
            map;
        });
        
        _primaryKeys = @{ @"users": @"id", @"products": @"id" };
    }

    return self;
}

- (NSArray *)tables
{
    return @[@"users", @"photos", @"developers", @"products"];
}

- (NSDictionary *)columnsMapForTable:(NSString *)tableName
{
    return _columnMaps[tableName];
}

- (NSString *)primaryKeyForTable:(NSString *)tableName
{
    return _primaryKeys[tableName];
}

- (BOOL)isTableExists:(NSString *)tableName
{
    __block BOOL result = NO;
    
    [_tables enumerateObjectsUsingBlock:
        ^ (NSString *t, NSUInteger idx, BOOL *stop) {
            if ([t isEqualToString:tableName]) {
                *stop = YES;
                result = YES;
            }
        }];
    
    return result;
}

- (NSArray *)columnsForTable:(NSString *)tableName
{
    return _columns[tableName];
}

- (NSString *)quoteTableName:(NSString *)tableName
{
    return [NSString stringWithFormat:@"\"%@\"", tableName];
}

- (NSString *)quoteColumnName:(NSString *)columnName
{
    return [NSString stringWithFormat:@"\"%@\"", columnName];
}

@end
