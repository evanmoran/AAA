//
//  UIColor+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UIColor+AAA.h"

@implementation UIColor (AAA)

+ (UIColor *) aaa_colorWithR:(uint)r G:(uint)g B:(uint)b A:(uint)a
{
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f];
}

+ (UIColor *) aaa_colorWithR:(uint)r G:(uint)g B:(uint)b
{
    return [UIColor aaa_colorWithR:r G:g B:b A:255];
}

+ (UIColor *) aaa_colorWithHex:(uint)hex alpha:(CGFloat)alpha
{
    int b = hex & 0x0000FF;
    int g = ((hex & 0x00FF00) >> 8);
    int r = ((hex & 0xFF0000) >> 16);
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}

+ (UIColor *) aaa_colorWithHex:(uint)hex
{
    return [UIColor aaa_colorWithHex:hex alpha: 1.0];
}

@end
