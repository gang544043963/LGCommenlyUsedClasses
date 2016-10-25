//
//  LGPositionTools.h
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//  用于布局为固定frame的控件放置

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
	AlignmentCenter = 0,
	AlignmentTop,
	AlignmentBottom,
	AlignmentLeft,
	AlignmentRight
} PlaceAlignmentType;

@interface LGPositionTools : NSObject

// 针对默认为竖屏的有效
+ (void)placeView:(UIView*)subview atTheCenterOfTheView:(UIView*)container;

+ (void)placeView:(UIView*)subview atTheLeftMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheRightMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheTopMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheBottomMiddleOfTheView:(UIView*)container offset:(float)offset;

+ (void)placeView:(UIView*)subview atTheLeftTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheRightTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheLeftBottomOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheRightBottomOfTheView:(UIView*)container offset:(CGSize)offset;

+ (void)placeView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span;

+ (void)placeView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span alignmentType:(PlaceAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span alignmentType:(PlaceAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span alignmentType:(PlaceAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span alignmentType:(PlaceAlignmentType)alignmentType;

// 用来处理横屏的情况下，在屏幕没有旋转到横屏位置之前的情况
+ (void)placeView:(UIView*)subview atTheCenterOfTheView:(UIView*)container needAlter:(BOOL)needAlter;

+ (void)placeView:(UIView*)subview atTheLeftMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheRightMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheTopMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheBottomMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;

+ (void)placeView:(UIView*)subview atTheRightTopOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheLeftBottomOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheRightBottomOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;

@end
