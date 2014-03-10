//
//  NSLayoutConstraint+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "NSLayoutConstraint+AAA.h"


@implementation NSLayoutConstraint (AAA)

+ (NSDictionary *)aaa_priorityMetrics
{
    return @{
         @"highPri": @(UILayoutPriorityDefaultHigh),
         @"lowPri": @(UILayoutPriorityDefaultLow),
    };
}

+ (NSArray *)aaa_constraintsWithItems:(NSArray *)views toBaseView:(UIView *)baseView equatingAttributes:(NSArray *)attributes;
{
    if (views.count < 2 || attributes.count < 1)
        return @[];
    NSMutableArray *constraints = [NSMutableArray array];
    for (UIView *view in views) {
        // Don't constrain a view to itself
        if (view == baseView)
            continue;

        // Constrain view to base
        for (NSNumber *boxedAttr in attributes) {
            NSLayoutAttribute attr = (NSLayoutAttribute)[boxedAttr integerValue];
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view
                                                                attribute:attr
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:baseView
                                                                attribute:attr
                                                               multiplier:1.0
                                                                 constant:0.0]];
        }
    }
    return constraints;
}


+ (NSArray *)aaa_constraintsWithItems:(NSArray *)views equatingAttributes:(NSArray *)attributes
{
    if (views.count < 2 || attributes.count < 1)
        return @[];
    return [self aaa_constraintsWithItems:views toBaseView:views[0] equatingAttributes:attributes];
}

// Return constains to vertically layout items with given spacing between them
+ (NSArray *)aaa_constraintsForVerticalLayoutOfItems:(NSArray *)views spacing:(CGFloat)spacing
{
    NSAssert(views.count >= 2, @"Expected more then one view");
    if (views.count < 2)
        return @[];

    NSMutableArray *constraints = [NSMutableArray arrayWithCapacity:views.count - 1];

    UIView *previousView = views[0];
    for (UIView *nextView in [views subarrayWithRange:NSMakeRange(1, views.count - 1)])
    {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:previousView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:nextView attribute:NSLayoutAttributeTop multiplier:1.0 constant:-spacing]];
        previousView = nextView;
    }

    return constraints;
}

+ (NSArray *)aaa_constraintsEquatingCenters:(NSArray *)views
{
    return [self aaa_constraintsWithItems:views equatingAttributes:@[@(NSLayoutAttributeCenterX), @(NSLayoutAttributeCenterY)]];
}

+ (NSArray *)aaa_constraintsEquatingFrames:(NSArray *)views
{
    return [self aaa_constraintsWithItems:views equatingAttributes:@[@(NSLayoutAttributeLeft), @(NSLayoutAttributeTop), @(NSLayoutAttributeWidth), @(NSLayoutAttributeHeight)]];
}

@end
