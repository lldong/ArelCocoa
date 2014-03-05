// ARELNodes.h
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

// node
#import "ARELNode.h"
#import "ARELSelectStatementNode.h"
#import "ARELSelectCoreNode.h"
#import "ARELInsertStatementNode.h"
#import "ARELUpdateStatementNode.h"

// terminal
#import "ARELDistinctNode.h"
#import "ARELTrueNode.h"
#import "ARELFalseNode.h"

// unary
#import "ARELUnaryNode.h"
#import "ARELGroupingNode.h"
#import "ARELOrderingNode.h"
#import "ARELUnqualifiedColumnNode.h"
#import "ARELWithNode.h"

// binary
#import "ARELBinaryNode.h"
#import "ARELEqualityNode.h"
#import "ARELInNode.h"
#import "ARELJoinSourcenode.h"
#import "ARELDeleteStatementnode.h"
#import "ARELTableAliasnode.h"
#import "ARELInfixOperationnode.h"
#import "ARELOverNode.h"

// nary
#import "ARELAndNode.h"

// function
// FIXME: Function + Alias can be rewritten as a Function and Alias node.
// We should make Function a Unary node and deprecate the use of "aliaz"
#import "ARELFunctionNode.h"
#import "ARELCountNode.h"
#import "ARELExtractNode.h"
#import "ARELValuesNode.h"
#import "ARELNamedFunctionNode.h"

// windows
#import "ARELWindowNode.h"

// joins
#import "ARELInnerJoinNode.h"
#import "ARELOuterJoinNode.h"
#import "ARELStringJoinNode.h"

#import "ARELSqlLiteralNode.h"

