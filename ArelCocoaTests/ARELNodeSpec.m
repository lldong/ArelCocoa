// ARELNodeSpec.m
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

#import <objc/runtime.h>
#import "ARELNodes.h"

SPEC_BEGIN(ARELNode)

it(@"implement factory methods", ^ {
    expect([ARELNode new]).to.respondTo(@selector(createJoin:constrain:class:));
});

it(@"all nodes are subclass of `ARELNode`", ^ {
    int classNum;
    Class * classes = NULL;
    
    classNum = objc_getClassList(NULL, 0);
    
    if (classNum > 0) {
        classes = (Class *)malloc(sizeof(Class) * classNum);
        classNum = objc_getClassList(classes, classNum);
    }
    
    for (int i = 0; i < classNum; i++) {
        NSString *className = @(class_getName(classes[i]));
        if ([className hasPrefix:@"AREL"] && [className hasSuffix:@"Node"]) {
            expect(classes[i]).to.beSubclassOf([ARELNode class]);
        }
    }

    free(classes);
});

describe(@"-eachNode:", ^{
    xit(@"iterate through AST", ^ {
        
    });
    
    xit(@"nodes will be yieled depth-first", ^ {
    
    });
});

SPEC_END
