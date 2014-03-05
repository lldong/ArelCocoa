// ARELBinaryNode.m
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

#import "ARELBinaryNode.h"

@implementation ARELBinaryNode {
    ARELNode *_leftNode;
    ARELNode *_rightNode;
}

- (instancetype)initWithLeftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super init])) {
        _leftNode = leftNode;
        _rightNode = rightNode;
    }
    
    return self;
}

- (ARELNode *)leftNode
{
    return _leftNode;
}

- (ARELNode *)rightNode
{
    return _rightNode;
}

- (BOOL)isEqualToNode:(ARELBinaryNode *)node
{
    if (!node) return NO;
    
    return ([[self leftNode] isEqual:[node leftNode]]
            && [[self rightNode] isEqual:[node rightNode]]);
}

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (![object isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToNode:object];
}

- (NSUInteger)hash
{
    return [@[[self leftNode], [self rightNode]] hash];
}

@end

@implementation ARELAsNode                 @end
@implementation ARELOrNode                 @end
@implementation ARELJoinNode               @end
@implementation ARELNotInNode              @end
@implementation ARELUnionNode              @end
@implementation ARELExceptNode             @end
@implementation ARELBetweenNode            @end
@implementation ARELMatchesNode            @end
@implementation ARELLessThanNode           @end
@implementation ARELNotEqualNode           @end
@implementation ARELUnionAllNode           @end
@implementation ARELIntersectNode          @end
@implementation ARELAssignmentNode         @end
@implementation ARELGreaterThanNode        @end
@implementation ARELDoesNotMatchNode       @end
@implementation ARELLessThanOrEqualNode    @end
@implementation ARELGreaterThanOrEqualNode @end
