// ARELFactoryMethods.m
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

#import "ARELFactoryMethods.h"
#import "ARELNodes.h"

@implementation ARELFactoryMethods

- (ARELTrueNode *)createTrue
{
    return [ARELTrueNode new];
}

- (ARELFalseNode *)createFalse
{
    return [ARELFalseNode new];
}

- (ARELTableAliasNode *)createTableAlias:(ARELNode *)relation name:(ARELSqlLiteralNode *)name
{
    return [[ARELTableAliasNode alloc] initWithLeftNode:relation rightNode:name];
}

- (ARELJoinNode *)createJoin:(ARELNode *)to constrain:(ARELNode *)constrain class:(Class)klass
{
    return [[klass alloc] initWithLeftNode:to rightNode:constrain];
}

- (ARELStringJoinNode *)createStringJoin:(ARELNode *)to
{
    return [[ARELStringJoinNode alloc] initWithLeftNode:to rightNode:nil];
}

- (ARELAndNode *)createAnd:(NSArray *)clauses
{
    return [[ARELAndNode alloc] initWithChildrenNodes:clauses];
}

- (ARELOnNode *)createOn:(ARELNode *)expr
{
    return [[ARELOnNode alloc] initWithExpression:expr];
}

- (ARELGroupingNode *)grouping:(ARELNode *)expr
{
    return [[ARELGroupingNode alloc] initWithExpression:expr];
}

// Create a LOWER() function
- (ARELNamedFunctionNode *)lower:(ARELNode *)expr
{
    return [[ARELNamedFunctionNode alloc] initWithName:@"LOWER" expressions:@[expr] alias:nil];
}

@end
