// ARELDistinctNodeSpec.m
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

SPEC_BEGIN(ARELDistinctNode)

describe(@"equality", ^{
    it(@"is equal with equal node", ^ {
        NSArray *array = @[
            [ARELDistinctNode new],
            [ARELDistinctNode new]
        ];
        
        expect([NSSet setWithArray:array]).to.haveCountOf(1);
    });
    
    it(@"is not equal with different node", ^ {
        NSArray *array = @[
            [ARELDistinctNode new],
            [ARELNode new]
        ];
        
        expect([NSSet setWithArray:array]).to.haveCountOf(2);
    });
});


SPEC_END
