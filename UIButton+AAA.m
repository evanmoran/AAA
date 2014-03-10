//
//  UIButton+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UIButton+AAA.h"
#import "UIColor+AAA.h"

@implementation UIButton (AAA)

+ (instancetype)aaa_buttonWithTitle:(NSString *)title font:(UIFont *)font tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button sizeToFit];
    if (font) {
        button.titleLabel.font = font;
    }
    if (tintColor) {
        button.tintColor = tintColor;
    }
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

+ (instancetype)aaa_buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
{
    return [self aaa_buttonWithTitle:title font:nil tintColor:nil target:target action:action];
}

@end
