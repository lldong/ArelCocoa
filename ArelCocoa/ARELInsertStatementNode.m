// ARELInsertStatementNode.m
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

#import "ARELInsertStatementNode.h"

@implementation ARELInsertStatementNode {
    NSArray *_values;
    NSArray *_columns;
}

- (instancetype)initWithColumns:(NSArray *)columns values:(NSArray *)values
{
    if ((self = [super init])) {
        _columns = [columns copy];
        _values = [values copy];
    }
    
    return self;
}

- (NSArray *)columns
{
    return _columns;
}

- (NSArray *)values
{
    return _values;
}

- (BOOL)isEqualToNode:(ARELInsertStatementNode *)other
{
    if (!other) return NO;
    
    return [[self columns] isEqualToArray:[other columns]]
               && [[self values] isEqualToArray:[other values]];
}

- (BOOL)isEqual:(id)other
{
    if (self == other) return YES;
    
    if (![other isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToNode:other];
}

- (NSUInteger)hash
{
    return [@[[self columns], [self values]] hash];
}

@end
