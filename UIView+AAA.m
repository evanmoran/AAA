//
//  UIView+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UIView+AAA.h"
#import "NSArray+AAA.h"
#import "NSLayoutConstraint+AAA.h"

const CGFloat AAANoConstraint = CGFLOAT_MIN;

@implementation UIView (AAA)

- (void)aaa_addSubviews:(NSArray *)views;
{
    for (UIView *view in views) {
        [self addSubview:view];
    }
}

- (void)aaa_addAutoLayoutSubviews:(NSArray *)views;
{
    for (UIView *view in views) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
    }
}

- (NSArray *)aaa_constraintsReferencingView:(id)view
{
    return [self.constraints aaa_all:^BOOL(NSLayoutConstraint *constraint){
        return (constraint.firstItem == view) || (constraint.secondItem == view);
    }];
}

- (void)aaa_removeConstraintsReferencingView:(id)view
{
    [self removeConstraints:[self aaa_constraintsReferencingView:view]];
}

- (void)aaa_removeConstraintsReferencingViews:(NSArray *)views
{
    for (UIView *view in views) {
        [self aaa_removeConstraintsReferencingView:view];
    }
}

- (void)aaa_constrainSize:(CGSize)size;
{
    if (size.width != UIViewNoIntrinsicMetric) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.0
                                                          constant:size.width]];
    }

    if (size.height != UIViewNoIntrinsicMetric) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.0
                                                          constant:size.height]];
    }
}

- (void)aaa_constrainToView:(UIView *)view
{
    [self aaa_constrainView:view inset:UIEdgeInsetsZero];
}

- (void)aaa_constrainView:(UIView *)view inset:(UIEdgeInsets)inset;
{
    if (inset.top != AAANoConstraint) {
        [self aaa_addEqualityConstraintOnAttribute:NSLayoutAttributeTop toSubview:view constant:inset.top];
    }
    if (inset.right != AAANoConstraint) {
        [self aaa_addEqualityConstraintOnAttribute:NSLayoutAttributeRight toSubview:view constant:-inset.right];
    }
    if (inset.bottom != AAANoConstraint) {
        [self aaa_addEqualityConstraintOnAttribute:NSLayoutAttributeBottom toSubview:view constant:-inset.bottom];
    }
    if (inset.left != AAANoConstraint) {
        [self aaa_addEqualityConstraintOnAttribute:NSLayoutAttributeLeft toSubview:view constant:inset.left];
    }
}

- (void)aaa_constrainVerticalLayoutOfSubviews:(NSArray *)subviews spacing:(CGFloat)spacing;
{
    NSArray *constraints = [NSLayoutConstraint aaa_constraintsForVerticalLayoutOfItems:subviews spacing:spacing];
    [self addConstraints:constraints];
}


- (void)aaa_constrainWithVisualFormat:(NSString *)format views:(NSDictionary *)views;
{
    [self aaa_constrainWithVisualFormat:format options:0 metrics:nil views:views];
}

- (void)aaa_constrainWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)options metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:options metrics:metrics views:views]];
}

- (void)aaa_addEqualityConstraintOnAttribute:(NSLayoutAttribute)attribute toSubview:(UIView *)subview constant:(CGFloat)constant;
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:attribute
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:attribute
                                                    multiplier:1.0
                                                      constant:-constant]];
}

- (void)aaa_addEqualityConstraintOnAttribute:(NSLayoutAttribute)attribute toSubview:(UIView *)subview
{
    [self aaa_addEqualityConstraintOnAttribute:attribute toSubview:subview constant:0.0];
}

#pragma mark - Class Methods

+ (void)aaa_animateWithDuration:(NSTimeInterval)duration
        mediaTimingFunctionName:(NSString *)timingName
                     animations:(void (^)(void))animations
                     completion:(void (^)(BOOL finished))completion;
{


    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:timingName]];
    [UIView animateWithDuration:duration animations:animations completion:completion];
//    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:animations completion:completion];
    [CATransaction commit];
}


@end
