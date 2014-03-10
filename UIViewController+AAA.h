//
//  UIViewController+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AAA)

- (void)aaa_addChildViewController:(UIViewController *)childViewController inView:(UIView *)view;
- (void)aaa_addChildViewController:(UIViewController *)childViewController;
- (void)aaa_removeChildViewController:(UIViewController *)childViewController;

@end
