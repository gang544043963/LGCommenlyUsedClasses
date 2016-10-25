//
//  NSString+Addition.h
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Addition)

//计算字符串长度，一个汉字1，一个字符0.5
- (int)textLength;

- (BOOL)isUsefulString;

- (BOOL)isHanzi;

- (CGSize)sizeConstrainedToSize:(CGSize)size font:(UIFont *)font;
- (CGFloat)heightConstrainedToSize:(CGSize)size font:(UIFont *)font;
- (CGFloat)widthConstrainedToSize:(CGSize)size font:(UIFont *)font;

+ (NSString *)intToString:(NSInteger)value;
+ (NSString *)doubleToString:(double)value;

//子字符串出现的次数
-(NSUInteger)occurenceOfString:(NSString *)substring;

@end
