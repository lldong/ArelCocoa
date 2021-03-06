// ARELInfixOperationNode.m
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

#import "ARELInfixOperationNode.h"

@implementation ARELInfixOperationNode {
    NSString *_operator;
}

+ (void)load
{
    [ARELMath extendClass:self];
    [ARELExpressions extendClass:self];
    [ARELPredictions extendClass:self];
    [ARELAliasPrediction extendClass:self];
    [ARELOrderPredications extendClass:self];
}

- (instancetype)initWithOperator:(NSString *)operator leftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super initWithLeftNode:leftNode rightNode:rightNode])) {
        _operator = operator;
    }
    
    return self;
}

- (NSString *)operator
{
    return _operator;
}

@end

@implementation ARELDivisionNode

- (id)initWithLeftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super initWithOperator:@"/" leftNode:leftNode rightNode:rightNode])) {
        
    }
    
    return self;
}

@end

@implementation ARELAdditionNode

- (id)initWithLeftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super initWithOperator:@"+" leftNode:leftNode rightNode:rightNode])) {
        
    }
    
    return self;
}

@end

@implementation ARELSubtractionNode

- (id)initWithLeftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super initWithOperator:@"-" leftNode:leftNode rightNode:rightNode])) {
        
    }
    
    return self;
}

@end

@implementation ARELMultiplicationNode

- (id)initWithLeftNode:(ARELNode *)leftNode rightNode:(ARELNode *)rightNode
{
    if ((self = [super initWithOperator:@"*" leftNode:leftNode rightNode:rightNode])) {
        
    }
    
    return self;
}

@end
