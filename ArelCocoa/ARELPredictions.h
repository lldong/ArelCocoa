// ARELPredictions.h
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

#import <Foundation/Foundation.h>
#import "ARELNodes.h"

@interface ARELPredictions : ARELNode

- (ARELNotEqualNode *)notEq:(ARELNode *)other;
- (ARELGroupingNode *)notEqAny:(NSArray *)others;
- (ARELGroupingNode *)notEqAll:(NSArray *)others;

- (ARELEqualityNode *)eq:(ARELNode *)other;
- (ARELGroupingNode *)eqAny:(NSArray *)others;
- (ARELGroupingNode *)eqAll:(NSArray *)others;

- (id)in:(ARELNode *)other;
- (ARELGroupingNode *)inAny:(NSArray *)others;
- (ARELGroupingNode *)inAll:(NSArray *)others;

- (id)notIn:(ARELNode *)other;
- (ARELGroupingNode *)noInAny:(NSArray *)others;
- (ARELGroupingNode *)notInAll:(NSArray *)others;

- (ARELMatchesNode *)matches:(ARELNode *)other;
- (ARELGroupingNode *)matchesAny:(NSArray *)others;
- (ARELGroupingNode *)matchesAll:(NSArray *)others;

- (ARELDoesNotMatchNode *)doesNotMatch:(ARELNode *)other;
- (ARELGroupingNode *)doesNotMatchAny:(NSArray *)others;
- (ARELGroupingNode *)doesNotMatchAll:(NSArray *)others;

- (ARELGreaterThanOrEqualNode *)gtEq:(ARELNode *)right;
- (ARELGroupingNode *)gtEqAny:(NSArray *)others;
- (ARELGroupingNode *)gtEqAll:(NSArray *)others;

- (ARELGreaterThanNode *)gt:(ARELNode *)right;
- (ARELGroupingNode *)gtAny:(NSArray *)others;
- (ARELGroupingNode *)gtAll:(NSArray *)others;

- (ARELLessThanNode *)lt:(ARELNode *)right;
- (ARELGroupingNode *)ltAny:(NSArray *)others;
- (ARELGroupingNode *)ltAll:(NSArray *)others;

- (ARELLessThanOrEqualNode *)ltEq:(ARELNode *)right;
- (ARELGroupingNode *)ltEqAny:(NSArray *)others;
- (ARELGroupingNode *)ltEqAll:(NSArray *)others;

- (ARELGroupingNode *)groupingAny:(NSArray *)others withSelector:(SEL)selector;
- (ARELGroupingNode *)groupingAll:(NSArray *)others withSelector:(SEL)selector;

@end
