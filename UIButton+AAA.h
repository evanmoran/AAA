//
//  UIButton+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AAA)

+ (instancetype)aaa_buttonWithTitle:(NSString *)title font:(UIFont *)font tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action;

+ (instancetype)aaa_buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
