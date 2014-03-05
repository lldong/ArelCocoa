// ARELFunctionNode.m
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

#import "ARELFunctionNode.h"
#import "ARELSqlLiteralNode.h"

@implementation ARELFunctionNode {
    NSArray *_expressions;
    ARELSqlLiteralNode *_alias;
}

// TODO: include Arel::Predications
// TODO: include Arel::WindowPredications

- (instancetype)initWithExpressions:(NSArray *)expressions alias:(ARELSqlLiteralNode *)alias;
{
    if ((self = [super init])) {
        _expressions = [expressions copy];

        if (alias) _alias = alias;
    }
    
    return self;
}

- (ARELSqlLiteralNode *)alias
{
    return _alias;
}

- (NSArray *)expressions
{
    return _expressions;
}

- (BOOL)distinct
{
    return NO;
}

- (ARELNode *)as:(ARELSqlLiteralNode *)alias
{
    _alias = alias;
    return self;
}

- (BOOL)isEqualToNode:(ARELFunctionNode *)other
{
    if (!other) return NO;

    if ([self alias]) {
        return ([[self expressions] isEqualToArray:[other expressions]]
                && [[self alias] isEqual:[other alias]]
                && [self distinct] == [other distinct]);
    } else {
        return ([[self expressions] isEqualToArray:[other expressions]]
                && [self distinct] == [other distinct]);
    }
}

- (BOOL)isEqual:(id)other
{
    if (self == other) return YES;
    
    if (![other isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToNode:other];
}

- (NSUInteger)hash
{
    if ([self alias]) {
        return [@[[self expressions], [self alias], @([self distinct])] hash];
    } else {
        return [@[[self expressions]] hash];
    }
}

@end

@implementation ARELSumNode    @end
@implementation ARELMaxNode    @end
@implementation ARELMinNode    @end
@implementation ARELAvgNode    @end
@implementation ARELExistsNode @end
