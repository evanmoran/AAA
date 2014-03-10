//
//  UIView+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_STATIC_INLINE CGRect UIViewGetFrame(UIView *v) {
    return v ? v.frame : CGRectZero;
}

UIKIT_STATIC_INLINE CGPoint UIViewGetOrigin(UIView *v) {
    return UIViewGetFrame(v).origin;
}

UIKIT_STATIC_INLINE CGSize UIViewGetSize(UIView *v) {
    return UIViewGetFrame(v).size;
}

UIKIT_STATIC_INLINE CGFloat UIViewGetMinX(UIView *v) {
    return CGRectGetMinX(UIViewGetFrame(v));
}

UIKIT_STATIC_INLINE CGFloat UIViewGetMinY(UIView *v) {
    return CGRectGetMinY(UIViewGetFrame(v));
}

UIKIT_STATIC_INLINE CGFloat UIViewGetMaxX(UIView *v) {
    return CGRectGetMaxX(UIViewGetFrame(v));
}

UIKIT_STATIC_INLINE CGFloat UIViewGetMaxY(UIView *v) {
    return CGRectGetMaxY(UIViewGetFrame(v));
}

UIKIT_STATIC_INLINE CGFloat UIViewGetHeight(UIView *v) {
    return CGRectGetHeight(UIViewGetFrame(v));
}

UIKIT_STATIC_INLINE CGFloat UIViewGetWidth(UIView *v) {
    return CGRectGetWidth(UIViewGetFrame(v));
}

const extern CGFloat AAANoConstraint;

@interface UIView (AAA)

/// Add subviews via an array
- (void)aaa_addSubviews:(NSArray *)views;

/// Add subviews via an array and automatically sets translatesAutoresizingMaskIntoConstraints to NO
- (void)aaa_addAutoLayoutSubviews:(NSArray *)views;

- (NSArray *)aaa_constraintsReferencingView:(id)view;

- (void)aaa_removeConstraintsReferencingView:(id)view;

- (void)aaa_removeConstraintsReferencingViews:(NSArray *)views;

/// Constrain the view to a fixed size. Best used when the view does not have an intrinsic size.
- (void)aaa_constrainSize:(CGSize)size;

/// Constrain the view to the superview's (self) frame
- (void)aaa_constrainToView:(UIView *)view;

/// Constrain a a view to an inset of its referencing self.
/// Set part of the inset to AAANoConstraint if you don't want a constraint on that edge
- (void)aaa_constrainView:(UIView *)view inset:(UIEdgeInsets)inset;

/// Constrain subviews to layout vertically with the given spacing between them
- (void)aaa_constrainVerticalLayoutOfSubviews:(NSArray *)subviews spacing:(CGFloat)spacing;

/// Constrain a subview with and equality constraint for a given attribute and constant modifier
- (void)aaa_addEqualityConstraintOnAttribute:(NSLayoutAttribute)attribute toSubview:(UIView *)subview constant:(CGFloat)constant;

/// Constain a subview with an equality constraint for a given attribute and a constant modifier of zero
- (void)aaa_addEqualityConstraintOnAttribute:(NSLayoutAttribute)attribute toSubview:(UIView *)subview;

#pragma mark - Class Methods

+ (void)aaa_animateWithDuration:(NSTimeInterval)duration
        mediaTimingFunctionName:(NSString *)timingName
                     animations:(void (^)(void))animations
                     completion:(void (^)(BOOL finished))completion;

@end
