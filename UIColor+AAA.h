//
//  UIColor+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AAA)

+ (UIColor *) aaa_colorWithR:(uint)r G:(uint)g B:(uint)b A:(uint)a;

+ (UIColor *) aaa_colorWithR:(uint)r G:(uint)g B:(uint)b;

+ (UIColor *) aaa_colorWithHex:(uint)hex alpha:(CGFloat)alpha;

+ (UIColor *) aaa_colorWithHex:(uint)hex;

@end





