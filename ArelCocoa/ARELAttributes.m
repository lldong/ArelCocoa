// ARELAttributes.m
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

#import "ARELAttributes.h"
#import "ARELAttribute.h"

@implementation ARELAttributes

+ (Class)for:(ARELColumn *)column
{
    switch (column.type) {
        /* String Attribute */
        case ARELColumnTypeText:
        case ARELColumnTypeString:
        case ARELColumnTypeBinary:    { return [ARELStringAttribute class]; } break;
        /* Integer Attribute */
        case ARELColumnTypeInteger:   { return [ARELIntegerAttribute class]; } break;
        /* Decimal Attribute */
        case ARELColumnTypeDecimal:   { return [ARELDecimalAttribute class]; } break;
        /* Float Attribute */
        case ARELColumnTypeFloat:     { return [ARELFloatAttribute class]; } break;
        /* Time Attribute */
        case ARELColumnTypeDate:
        case ARELColumnTypeTime:
        case ARELColumnTypeDateTime:
        case ARELColumnTypeTimestamp: { return [ARELTimeAttribute class]; } break;
        /* Boolean Attribute */
        case ARELColumnTypeBoolean:   { return [ARELBooleanAttribute class]; } break;
        /* Undefined Attribute */
        default:                      { return [ARELUndefinedAttribute class]; };
    }
}

@end
