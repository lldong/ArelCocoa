// ARELAndNode.m
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

#import "ARELAndNode.h"

@implementation ARELAndNode {
    NSArray *_childrenNodes;
}

- (instancetype)initWithChildrenNodes:(NSArray *)children
{
    if ((self = [super init])) {
        _childrenNodes = [children copy];
    }
    
    return self;
}

- (NSArray *)childrenNodes
{
    return _childrenNodes;
}

- (ARELNode *)rightNode
{
    return [[self childrenNodes] firstObject];
}

- (ARELNode *)leftNode
{
    if ([[self childrenNodes] count] > 1) {
        return [self childrenNodes][1];
    }

    return nil;
}

- (BOOL)isEqualToNode:(ARELAndNode *)other
{
    if (!other) return NO;
    
    return [[self childrenNodes] isEqualToArray:[other childrenNodes]];
}

- (BOOL)isEqual:(id)other
{
    if (self == other) return YES;
    
    if (![other isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToNode:other];
}

- (NSUInteger)hash
{
    return [[self childrenNodes] hash];
}

@end
