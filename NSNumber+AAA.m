//
//  NSNumber+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#include <stdlib.h>

#import "NSNumber+AAA.h"

@implementation NSNumber (AAA)

+ (NSNumber *)aaa_randomNumberFromMin:(NSNumber *)min toMax:(NSNumber *)max;
{
    return @([self aaa_randomDoubleFromMin:[min doubleValue] toMax:[max doubleValue]]);
}

+ (double)aaa_randomDoubleFromMin:(double)min toMax:(double)max;
{
    return min + ((double)arc4random() / (double)UINT32_MAX) * (max - min);
}

+ (CGFloat)aaa_randomCGFloatFromMin:(CGFloat)min toMax:(CGFloat)max;
{
    return (CGFloat)[self aaa_randomDoubleFromMin:(double)min toMax:(double)max];
}

+ (NSUInteger)aaa_randomUIntegerFromMin:(NSUInteger)min toMax:(NSUInteger)max
{
    // Todo: extend this for all bits (not just int32 worth)
    NSCAssert(min <= UINT32_MAX && max <= UINT32_MAX, @"aaa_randomUIntegerFromMin:toMax: Currently only 32bit precision supported");
    if(!(min <= UINT32_MAX && max <= UINT32_MAX))
        return 0;
    return (NSUInteger)[self aaa_randomUInt32FromMin:(uint32_t)min toMax:(uint32_t)max];
}

+ (uint32_t)aaa_randomUInt32FromMin:(uint32_t)min toMax:(uint32_t)max;
{
    return min + arc4random_uniform(max-min+1);
}

+ (NSUInteger)aaa_randomIndexForCount:(NSUInteger)count;
{
    NSCAssert(count, @"There are no valid indexes for an array of count zero");
    if (!count)
        return 0;
    return [self aaa_randomUInt32FromMin:0 toMax:(uint32_t)count-1];
}

+ (NSNumber *)aaa_randomNumber0to1;
{
    return @([self aaa_randomDoubleFromMin:0.0 toMax:1.0]);
}

+ (double)aaa_randomDouble0to1;
{
    return [self aaa_randomDoubleFromMin:0.0 toMax:1.0];
}

+ (CGFloat)aaa_randomCGFloat0to1;
{
    return [self aaa_randomCGFloatFromMin:0.0f toMax:1.0f];
}

@end
