// ARELToSqlVisitor.m
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

#import "ARELToSqlVisitor.h"

#import "ARELNodes.h"
#import "ARELConnection.h"

#define WHERE     @' WHERE '
#define SPACE     @' '
#define COMMA     @', '
#define GROUP_BY  @' GROUP BY '
#define ORDER_BY  @' ORDER BY '
#define WINDOW    @' WINDOW '
#define AND       @' AND '
#define DISTINCT  @'DISTINCT'

@implementation ARELToSqlVisitor {
    ARELConnection *_connection;
    NSMutableDictionary *_quotedTables;
    NSMutableDictionary *_quotedColumns;
}

- (instancetype)initWithConnection:(ARELConnection *)conn
{
    if ((self = [super init])) {
        _connection = conn;
        _quotedTables = [NSMutableDictionary dictionary];
        _quotedColumns = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (id)visit:(ARELNode *)node
{
    NSString *className = @(object_getClassName(node));
    if ([className hasPrefix:@"AREL"] && [className hasSuffix:@"Node"]) {
        NSString *nodeName = [className substringFromIndex:4];
        NSString *methodName = [NSString stringWithFormat:@"visit%@:", nodeName];

#       pragma clang diagnostic push
#       pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [self performSelector:NSSelectorFromString(methodName) withObject:node];
#       pragma clang diagnostic pop
    }
    
    return nil;
}

- (id)visitBindParamNode:(ARELBindParamNode *)node
{
    return [node stringValue];
}

- (id)visitSqlLiteralNode:(ARELSqlLiteralNode *)node
{
    return [node stringValue];
}

@end
