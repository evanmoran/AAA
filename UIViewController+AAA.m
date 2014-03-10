//
//  UIViewController+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UIViewController+AAA.h"

@implementation UIViewController (AAA)

- (void)aaa_addChildViewController:(UIViewController *)childViewController inView:(UIView *)view
{
    [self addChildViewController:childViewController];
    [view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)aaa_addChildViewController:(UIViewController *)childViewController
{
    [self aaa_addChildViewController:childViewController inView:self.view];
}

- (void)aaa_removeChildViewController:(UIViewController *)childViewController
{
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

@end
