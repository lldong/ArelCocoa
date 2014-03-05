// ARELPredictions.m
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

#import "ARELPredictions.h"
#import "ARELSelectManager.h"

@implementation ARELPredictions

#pragma mark -

- (ARELNotEqualNode *)notEq:(ARELNode *)other
{
    return [[ARELNotEqualNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)notEqAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(notEq:)];
}

- (ARELGroupingNode *)notEqAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(notEq:)];
}

#pragma mark -

- (ARELEqualityNode *)eq:(ARELNode *)other
{
    return [[ARELEqualityNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)eqAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(eq:)];
}

- (ARELGroupingNode *)eqAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(eq:)];
}

#pragma mark -

- (ARELInNode *)in:(id)other
{
    if ([other isKindOfClass:[ARELSelectManager class]]) {
        return [[ARELInNode alloc] initWithLeftNode:self rightNode:[other ast]];
    }
    
    return [[ARELInNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)inAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(in:)];
}

- (ARELGroupingNode *)inAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(in:)];
}

#pragma mark -

- (ARELNotInNode *)notIn:(id)other
{
    if ([other isKindOfClass:[ARELSelectManager class]]) {
        return [[ARELNotInNode alloc] initWithLeftNode:self rightNode:[other ast]];
    }
    
    return [[ARELNotInNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)noInAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(notIn:)];
}

- (ARELGroupingNode *)notInAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(notIn:)];
}

#pragma mark -

- (ARELMatchesNode *)matches:(ARELNode *)other
{
    return [[ARELMatchesNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)matchesAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(matches:)];
}

- (ARELGroupingNode *)matchesAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(matches:)];
}

#pragma mark - 

- (ARELDoesNotMatchNode *)doesNotMatch:(ARELNode *)other
{
    return [[ARELDoesNotMatchNode alloc] initWithLeftNode:self rightNode:other];
}

- (ARELGroupingNode *)doesNotMatchAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(doesNotMatch:)];
}

- (ARELGroupingNode *)doesNotMatchAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(doesNotMatch:)];
}

#pragma mark -

- (ARELGreaterThanOrEqualNode *)gtEq:(ARELNode *)right
{
    return [[ARELGreaterThanOrEqualNode alloc] initWithLeftNode:self rightNode:right];
}

- (ARELGroupingNode *)gtEqAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(gtEq:)];
}

- (ARELGroupingNode *)gtEqAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(gtEq:)];
}

#pragma mark -

- (ARELGreaterThanNode *)gt:(ARELNode *)right
{
    return [[ARELGreaterThanNode alloc] initWithLeftNode:self rightNode:right];
}

- (ARELGroupingNode *)gtAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(gt:)];
}

- (ARELGroupingNode *)gtAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(gt:)];
}

#pragma mark -

- (ARELLessThanNode *)lt:(ARELNode *)right
{
    return [[ARELLessThanNode alloc] initWithLeftNode:self rightNode:right];
}

- (ARELGroupingNode *)ltAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(lt:)];
}

- (ARELGroupingNode *)ltAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(lt:)];
}

#pragma mark -

- (ARELLessThanOrEqualNode *)ltEq:(ARELNode *)right
{
    return [[ARELLessThanOrEqualNode alloc] initWithLeftNode:self rightNode:right];
}

- (ARELGroupingNode *)ltEqAny:(NSArray *)others
{
    return [self groupingAny:others withSelector:@selector(ltEq:)];
}

- (ARELGroupingNode *)ltEqAll:(NSArray *)others
{
    return [self groupingAll:others withSelector:@selector(ltEq:)];
}

#pragma mark - Helpers

- (ARELGroupingNode *)groupingAny:(NSArray *)others withSelector:(SEL)selector
{
    NSMutableArray *nodes = [NSMutableArray array];
    [others enumerateObjectsUsingBlock:^(ARELNode *expr, NSUInteger idx, BOOL *stop) {
#       pragma clang diagnostic push
#       pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [nodes addObject:[self performSelector:selector withObject:expr]];
#       pragma clang diagnostic pop
    }];
    
    __block ARELNode *expr = nil;
    [nodes enumerateObjectsUsingBlock:^(ARELNode *node, NSUInteger idx, BOOL *stop) {
        expr = expr ? [[ARELOrNode alloc] initWithLeftNode:expr rightNode:node] : node;
    }];
    
    return [[ARELGroupingNode alloc] initWithExpression:expr];
}

- (ARELGroupingNode *)groupingAll:(NSArray *)others withSelector:(SEL)selector
{
    NSMutableArray *nodes = [NSMutableArray array];
    [others enumerateObjectsUsingBlock:^(ARELNode *expr, NSUInteger idx, BOOL *stop) {
#       pragma clang diagnostic push
#       pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [nodes addObject:[self performSelector:selector withObject:expr]];
#       pragma clang diagnostic pop
    }];
    
    ARELAndNode *andNode = [[ARELAndNode alloc] initWithChildrenNodes:nodes];
    return [[ARELGroupingNode alloc] initWithExpression:andNode];
}

@end
