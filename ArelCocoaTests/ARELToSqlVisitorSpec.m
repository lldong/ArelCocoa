// ARELToSqlVisitorSpec.m
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

#import "ARELToSqlVisitor.h"

#import "ARELNodes.h"
#import "ARELTable.h"
#import "FakeConnection.h"

SPEC_BEGIN(ARELToSqlVisitor)

__block ARELTable *table;
__block ARELToSqlVisitor *visitor;
__block ARELConnection *connection;

beforeEach(^ {
    connection = [FakeConnection new];
    visitor = [[ARELToSqlVisitor alloc] initWithConnection:connection];
    table = [[ARELTable alloc] initWithName:@"users" connection:connection];
});

it(@"works with bind parameters", ^ {
    ARELNode *node = [[ARELBindParamNode alloc] initWithString:@"omg"];
    NSString *SQL = [node accept:visitor];
    expect(SQL).to.equal(@"omg");
});

it(@"works with SQL literal", ^ {
    ARELNode *node = [[ARELSqlLiteralNode alloc] initWithString:@"omg"];
    NSString *SQL = [node accept:visitor];
    expect(SQL).to.equal(@"omg");
});

it(@"must not quote SQL literal", ^ {
    
});


SPEC_END
