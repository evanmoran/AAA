//
//  UITextField+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UITextField+AAA.h"

#import <QuartzCore/QuartzCore.h>

#import "UIColor+AAA.h"

@implementation UITextField (AAA)

+ (instancetype)aaa_textFieldText:(NSString *)text placeholder:(NSString *)placeholder font:(UIFont *)font color:(UIColor *)color;
{
    UITextField *out = [[UITextField alloc] initWithFrame:CGRectZero];
    out.text = text;
    out.placeholder = placeholder;
    out.textColor = color;
    out.font = font;
    return out;
}

@end
