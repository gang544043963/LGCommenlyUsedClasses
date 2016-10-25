//
//  UIImage+Extensions.h
//
//  Created by Hardy Macia on 7/1/09.
//  Copyright 2009 Catamount Software. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (CS_Extensions)

- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMaximumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage*)getSubImageWithSize:(CGSize)targetSize;
- (UIImage*)getSubImage:(CGRect)rect;

@end;
