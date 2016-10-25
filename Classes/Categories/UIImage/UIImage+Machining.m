//
//  UIImage+Machining.m
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import "UIImage+Machining.h"

@implementation UIImage (Machining)

+ (UIImage *)imageWithUIView:(UIView *)view {
	
	CGSize screenShotSize = view.bounds.size;
	UIImage *image;
	UIGraphicsBeginImageContext(screenShotSize);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[view drawLayer:view.layer inContext:context];
	image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}

//聊天室头像图片拼接
#define SpliceImageWidth 92.0f
#define SpliceImageHeight 92.0f
#define Margins 3.0f
#define Space 4.0f

+ (UIImage *)SpliceToOneImageBYSomeImages:(NSArray *)images AndBageImage:(UIImage *)bgImage {
	//images  count > 2 && count < 9
	CGRect frame=CGRectMake(0, 0, SpliceImageWidth, SpliceImageHeight);
	UIGraphicsBeginImageContext(CGSizeMake(frame.size.width, frame.size.height));
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextScaleCTM(context, 1, -1);
	CGContextTranslateCTM(context, 0, -frame.size.height);
	CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
	CGContextFillRect(context, frame);
	
	CGImageRef imageRef = bgImage.CGImage;
	CGContextDrawImage(context, frame, imageRef);
	
	CGFloat everyImageWidth = 0.0f;
	CGFloat everyImageHeight = 0.0f;
	
	int verticalNum = images.count <= 4 ? 2: 3;  //小于等于4  2列  大于等于4 3列
	int horizontalNum = images.count/verticalNum + (images.count%verticalNum ? 1 : 0); //行数等于总图片数除以列加上 总图片除以列的余数
	int firstLineNum = images.count%verticalNum ? images.count%verticalNum: verticalNum; //第一行个数
	
	int maxNum = verticalNum > horizontalNum ? verticalNum : horizontalNum;
	everyImageWidth = (SpliceImageWidth-Margins*2-Space*(maxNum-1))/maxNum;
	everyImageHeight = (SpliceImageHeight-Margins*2-Space*(maxNum-1))/maxNum;
	
	for (int i = 0; i < images.count; i++) {
		UIImage *im = [images objectAtIndex:i];
		CGImageRef imageRef = /**[im roundedCornerImage:2 borderSize:1]*/im.CGImage;
		
		CGFloat x = 0.0f;
		CGFloat y = 0.0f;
		
		int curHorizontal = 0; //当前行
		int curVertical = 0;   //当前列
		
		if (i < firstLineNum) {
			curHorizontal = 0;
			curVertical = i;
		}else{
			curHorizontal = 1+(i-firstLineNum)/verticalNum;
			curVertical = (i-firstLineNum)%verticalNum;
		}
		
		CGFloat firstSpaceX = curHorizontal == 0 ? (SpliceImageWidth-everyImageWidth*firstLineNum-Space*(firstLineNum-1))/2 : Margins;
		x = firstSpaceX + curVertical*(everyImageWidth+Space);
		
		CGFloat firstSpaceY = (SpliceImageHeight-everyImageHeight*horizontalNum-Space*(horizontalNum-1))/2;
		y = firstSpaceY + (horizontalNum-curHorizontal-1)*(everyImageHeight+Space);//坐标系是反的要从下往上算
		
		CGRect imageRect = CGRectMake(x, y, everyImageWidth, everyImageHeight);
		
		CGContextDrawImage(context, imageRect, imageRef);
	}
	
	UIImage * finishImage= UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return finishImage;
}


@end
