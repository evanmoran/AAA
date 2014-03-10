//
//  NSNumber+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreGraphics/CGGeometry.h>

@interface NSNumber (AAA)

+ (NSNumber *)aaa_randomNumberFromMin:(NSNumber *)min toMax:(NSNumber *)max;
+ (double)aaa_randomDoubleFromMin:(double)min toMax:(double)max;
+ (CGFloat)aaa_randomCGFloatFromMin:(CGFloat)min toMax:(CGFloat)max;
+ (NSUInteger)aaa_randomUIntegerFromMin:(NSUInteger)min toMax:(NSUInteger)max;
+ (NSUInteger)aaa_randomIndexForCount:(NSUInteger)count;

+ (NSNumber *)aaa_randomNumber0to1;
+ (double)aaa_randomDouble0to1;
+ (CGFloat)aaa_randomCGFloat0to1;

@end
