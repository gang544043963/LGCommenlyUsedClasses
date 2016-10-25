//
//  UIImage+Extensions.m
//
//  Created by Hardy Macia on 7/1/09.
//  Copyright 2009 Catamount Software. All rights reserved.
//

#import "UIImage+Extensions.h"

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

@implementation UIImage (CS_Extensions)

-(UIImage *)imageAtRect:(CGRect)rect
{
  
  CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
  UIImage* subImage = [UIImage imageWithCGImage: imageRef];
  CGImageRelease(imageRef);
  
  return subImage;
  
}

//@@ Kevin Added new algorithm generating image
- (UIImage *)imageByScalingProportionallyToMaximumSize:(CGSize)targetSize {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize originalSize = sourceImage.size;
    
    CGFloat scaleFactor;
    if (CGSizeEqualToSize(originalSize, targetSize)) {
        scaleFactor = 1.0f;
    } else {
        CGFloat widthFactor = targetSize.width / originalSize.width;
        CGFloat heightFactor = targetSize.height / originalSize.height;
        if (widthFactor < heightFactor) {
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
    }
    
    //
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.size.width  = floor(originalSize.width * scaleFactor);
    thumbnailRect.size.height = floor(originalSize.height * scaleFactor);
    
    UIGraphicsBeginImageContextWithOptions(thumbnailRect.size, NO, 0.0f);
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    return newImage;
}

- (UIImage*)getSubImageWithSize:(CGSize)targetSize
{
    CGSize originalSize = self.size;
    //
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    thumbnailRect.origin.x = (originalSize.width - targetSize.width)/2;
    thumbnailRect.origin.y = (originalSize.height - targetSize.height)/2;

    return [self getSubImage:thumbnailRect];
}

- (UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    
    return smallImage;
}

- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize {
  
  UIImage *sourceImage = self;
  UIImage *newImage = nil;
  
  CGSize imageSize = sourceImage.size;
  CGFloat width = imageSize.width;
  CGFloat height = imageSize.height;
  
  CGFloat targetWidth = targetSize.width;
  CGFloat targetHeight = targetSize.height;
  
  CGFloat scaleFactor = 0.0;
  CGFloat scaledWidth = targetWidth;
  CGFloat scaledHeight = targetHeight;
  
  CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
  
  if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
    
    CGFloat widthFactor = targetWidth / width;
    CGFloat heightFactor = targetHeight / height;
    
    if (widthFactor > heightFactor) 
      scaleFactor = widthFactor;
    else
      scaleFactor = heightFactor;
    
    scaledWidth  = width * scaleFactor;
    scaledHeight = height * scaleFactor;
    
    // center the image
    
    if (widthFactor > heightFactor) {
      thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
    } else if (widthFactor < heightFactor) {
      thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
    }
  }
  
  
  // this is actually the interesting part:
  
  UIGraphicsBeginImageContext(targetSize);
  
  CGRect thumbnailRect = CGRectZero;
  thumbnailRect.origin = thumbnailPoint;
  thumbnailRect.size.width  = scaledWidth;
  thumbnailRect.size.height = scaledHeight;
  
  [sourceImage drawInRect:thumbnailRect];
  
  newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  if(newImage == nil) NSLog(@"could not scale image");
  
  
  return newImage ;
}


- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize {
  
  UIImage *sourceImage = self;
  UIImage *newImage = nil;
  
  CGSize imageSize = sourceImage.size;
  CGFloat width = imageSize.width;
  CGFloat height = imageSize.height;
  
  CGFloat targetWidth = targetSize.width;
  CGFloat targetHeight = targetSize.height;
  
  CGFloat scaleFactor = 0.0;
  CGFloat scaledWidth = targetWidth;
  CGFloat scaledHeight = targetHeight;
  
  CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
  
  if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
    
    CGFloat widthFactor = targetWidth / width;
    CGFloat heightFactor = targetHeight / height;
    
    if (widthFactor < heightFactor) 
      scaleFactor = widthFactor;
    else
      scaleFactor = heightFactor;
    
    scaledWidth  = width * scaleFactor;
    scaledHeight = height * scaleFactor;
    
    // center the image
    
    if (widthFactor < heightFactor) {
      thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
    } else if (widthFactor > heightFactor) {
      thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
    }
  }
  
  
  // this is actually the interesting part:
  
  UIGraphicsBeginImageContext(targetSize);
  
  CGRect thumbnailRect = CGRectZero;
  thumbnailRect.origin = thumbnailPoint;
  thumbnailRect.size.width  = scaledWidth;
  thumbnailRect.size.height = scaledHeight;
  
  [sourceImage drawInRect:thumbnailRect];
  
  newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  if(newImage == nil) NSLog(@"could not scale image");
  
  
  return newImage ;
}


- (UIImage *)imageByScalingToSize:(CGSize)targetSize {
    
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    //   CGSize imageSize = sourceImage.size;
    //   CGFloat width = imageSize.width;
    //   CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    //   CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    
    return newImage ;
}


- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
  return [self imageRotatedByDegrees:RadiansToDegrees(radians)];
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees 
{   
  // calculate the size of the rotated view's containing box for our drawing space
  UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
  CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
  rotatedViewBox.transform = t;
  CGSize rotatedSize = rotatedViewBox.frame.size;
  
  // Create the bitmap context
  UIGraphicsBeginImageContext(rotatedSize);
  CGContextRef bitmap = UIGraphicsGetCurrentContext();
  
  // Move the origin to the middle of the image so we will rotate and scale around the center.
  CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
  
  //   // Rotate the image context
  CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
  
  // Now, draw the rotated/scaled image into the context
  CGContextScaleCTM(bitmap, 1.0, -1.0);
  CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
  
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
  
}

@end;
