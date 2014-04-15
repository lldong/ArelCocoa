// ARELNode.h
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
#import "ARELFactoryMethods.h"

@class ARELVisitor;

// Abstract base class for all AST nodes
@interface ARELNode : NSObject <ARELFactoryMethods>

// Factory method to create a ARELNotNode that has the recipient of
// the caller as a child.
- (ARELNode *)not;

// Factory method to create an `ARELGroupingNode` that has an `ARELOrNode`
// as a child.
- (ARELNode *)or:(ARELNode *)node;

// Factory method to create an `ARELAndNode`
- (ARELNode *)and:(ARELNode *)node;

// Generate SQL
- (NSString *)toSQL;

- (id)accept:(ARELVisitor *)visitor;

@end
