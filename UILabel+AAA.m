//
//  UILabel+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UILabel+AAA.h"
#import "UIColor+AAA.h"

@implementation UILabel (AAA)

+ (instancetype)aaa_labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = font;
    label.text = text;
    label.textColor = color;
    [label sizeToFit];
    return label;
}

@end
