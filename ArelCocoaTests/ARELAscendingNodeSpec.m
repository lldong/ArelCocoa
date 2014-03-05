// ARELAscendingNodeSpec.m
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

#import "ARELNodes.h"

SPEC_BEGIN(ARELAscendingNode)

__block ARELAscendingNode *ascending = nil;
beforeAll(^ {
    ascending = [[ARELAscendingNode alloc] initWithExpression:AREL_SQL(@"zomg")];
});

describe(@"-reverse", ^ {
    it(@"create an `ARELDescendingNode`", ^ {
        ARELOrderingNode *descending = [ascending reverse];
        expect(descending).to.beKindOf([ARELDescendingNode class]);
    });
    
    it(@"preserve the expression", ^ {
        ARELOrderingNode *descending = [ascending reverse];
        expect([descending expression]).to.equal([ascending expression]);
    });
});

describe(@"-direction", ^ {
    it(@"returns the correct direction", ^ {
        expect([ascending direction]).to.equal(ARELAscendingOrder);
    });
});

describe(@"-isAscending", ^ {
    it(@"returns YES", ^ {
        expect([ascending isAscending]).to.beTruthy();
    });
});

describe(@"-isDescending", ^ {
    it(@"return NO", ^ {
        expect([ascending isDescending]).to.beFalsy();
    });
});

SPEC_END
