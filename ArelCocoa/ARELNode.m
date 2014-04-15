// ARELNode.m
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

#import "ARELNode.h"

#import "ARELVisitor.h"
#import "ARELAndNode.h"
#import "ARELUnaryNode.h"
#import "ARELBinaryNode.h"
#import "ARELGroupingNode.h"

@implementation ARELNode

+ (void)load
{
    [ARELFactoryMethods extendClass:self];
}

- (id)accept:(ARELVisitor *)visitor
{
    return [visitor visit:self];
}

- (ARELNode *)not
{
    return [[ARELNotNode alloc] initWithExpression:self];
}

- (ARELNode *)or:(ARELNode *)rightNode
{
    ARELNode *orNode = [[ARELOrNode alloc] initWithLeftNode:self rightNode:rightNode];
    return [[ARELGroupingNode alloc] initWithExpression:orNode];
}

- (ARELNode *)and:(ARELNode *)rightNode
{
    return [[ARELAndNode alloc] initWithChildrenNodes:@[self, rightNode]];
}

// FIXME: this method should go away.  I don't like people calling
// `-toSQL` on non-head nodes.  This forces us to walk the AST until we
// can find a node that has a "relation" member.
//
// Maybe we should just use `Table.engine`?  :'(
- (NSString *)toSQL
{
    // TODO: Implement it!
    // engine.connection.visitor.accept self
    return nil;
}

//# Iterate through AST, nodes will be yielded depth-first
//def each &block
//return enum_for(:each) unless block_given?
//
//::Arel::Visitors::DepthFirst.new(block).accept self
//end

@end
