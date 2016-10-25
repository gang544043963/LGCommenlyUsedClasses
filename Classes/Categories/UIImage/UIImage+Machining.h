//
//  UIImage+Machining.h
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Machining)

//take ScreenShot for view
+ (UIImage *)imageWithUIView:(UIView *)view;
//聊天室头像图片拼接
+ (UIImage *)SpliceToOneImageBYSomeImages:(NSArray *)images AndBageImage:(UIImage *)bgImage;

@end
