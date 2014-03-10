//
//  UIImage+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "UIImage+AAA.h"
#import "CGGeometry+AAA.h"

@implementation UIImage (AAA)

- (UIImage *)aaa_resizedImage:(CGSize)newSize transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality
{
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGRect imageRect = CGRectCenteredInRect(newRect, self.size);
    CGImageRef imageRef = self.CGImage;

    // Build a context that's the same dimensions as the new size
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
        (size_t)CGRectGetWidth(newRect),
        (size_t)CGRectGetHeight(newRect),
        CGImageGetBitsPerComponent(imageRef),
        0,
        CGImageGetColorSpace(imageRef),
        CGImageGetBitmapInfo(imageRef));

    // Rotate and/or flip the image if required by its orientation
    CGContextConcatCTM(bitmap, transform);

    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(bitmap, quality);

    // Draw into the context; this scales the image
//    CGContextDrawImage(bitmap, transpose ? CGRectTranspose(newRect) : newRect, imageRef);
    CGContextDrawImage(bitmap, transpose ? CGRectTranspose(imageRect) : imageRect, imageRef);

    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];

    // Clean up
    CGContextRelease(bitmap);
    CGImageRelease(newImageRef);

    return newImage;
}

- (BOOL)aaa_writePNG:(NSURL *)url options:(NSDataWritingOptions)options error:(NSError **)outError
{
    NSData *png = UIImagePNGRepresentation(self);
    NSError *error = nil;
    if (![png writeToURL:url options:options error:&error]) {
        NSLog(@"Error writing PNG: %@", error);
        if (outError) { *outError = error; }
    }
    return YES;
}

@end
