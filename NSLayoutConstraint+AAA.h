//
//  NSLayoutConstraint+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSLayoutConstraint (AAA)

/**
 * Returns values for keys "lowPri" and "highPri"
 */
+ (NSDictionary *)aaa_priorityMetrics;

// Constrain items to a base view
+ (NSArray *)aaa_constraintsWithItems:(NSArray *)views toBaseView:(UIView *)baseView equatingAttributes:(NSArray *)attributes;

// Constrain items by equating attributes. Base view is assumed to be the first item.
+ (NSArray *)aaa_constraintsWithItems:(NSArray *)views equatingAttributes:(NSArray *)attributes;

+ (NSArray *)aaa_constraintsEquatingCenters:(NSArray *)views;

+ (NSArray *)aaa_constraintsEquatingFrames:(NSArray *)views;

// Return constains to vertically layout items with given spacing between them
+ (NSArray *)aaa_constraintsForVerticalLayoutOfItems:(NSArray *)views spacing:(CGFloat)spacing;

@end
