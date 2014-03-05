// ARELUnaryNode.m
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

#import "ARELUnaryNode.h"

@implementation ARELUnaryNode {
    ARELNode *_expression;
}

- (instancetype)initWithExpression:(ARELNode *)expr
{
    if ((self = [super init])) {
        _expression = expr;
    }
    
    return self;
}

- (ARELNode *)value
{
    return [self expression];
}

- (ARELNode *)expression
{
    return _expression;
}

- (BOOL)isEqualToNode:(ARELUnaryNode *)node
{
    if (!node) return NO;

    return [[self expression] isEqual:[node expression]];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (![object isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToNode:object];
}

- (NSUInteger)hash
{
    return [[self expression] hash];
}

@end

@implementation ARELOnNode         @end
@implementation ARELBinNode        @end
@implementation ARELNotNode        @end
@implementation ARELTopNode        @end
@implementation ARELLockNode       @end
@implementation ARELGroupNode      @end
@implementation ARELLimitNode      @end
@implementation ARELHavingNode     @end
@implementation ARELOffsetNode     @end
@implementation ARELDistinctOnNode @end
