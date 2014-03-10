//
//  UIImage+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AAA)

- (UIImage *)aaa_resizedImage:(CGSize)newSize transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (BOOL)aaa_writePNG:(NSURL *)url options:(NSDataWritingOptions)options error:(NSError **)outError;

@end
