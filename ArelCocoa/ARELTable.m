// ARELTable.m
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

#import "ARELTable.h"
#import "ARELConnection.h"

@implementation ARELTable {
    NSString *_name;
    ARELConnection *_connection;
}

static ARELConnection *_defaultConnection = nil;

+ (ARELConnection *)defaultConnection
{
    return _defaultConnection;
}

+ (void)setDefaultConnection:(ARELConnection *)connection
{
    _defaultConnection = connection;
}

+ (instancetype)tableWithName:(NSString *)tableName
{
    return [[self alloc] initWithName:tableName connection:[self defaultConnection]];
}

- (instancetype)initWithName:(NSString *)name connection:(ARELConnection *)conn;
{
    if ((self = [super init])) {
        _name = [name copy];
        _connection = conn ?: [ARELTable defaultConnection];
    }
    
    return self;
}

@end
