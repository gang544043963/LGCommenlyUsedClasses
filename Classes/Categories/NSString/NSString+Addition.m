//
//  NSString+Addition.m
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (int)textLength {
	float number = 0.0;
	for (int index = 0; index < [self length]; index++) {
		NSString *character = [self substringWithRange:NSMakeRange(index, 1)];
		if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3) {
			number++;
		} else {
			number = number + 0.5;
		}
	}
	return ceil(number);
}

- (BOOL)isUsefulString {
	
	if (self && ![self isEqual:[NSNull null]] && [self length] > 0 && ![self isEqualToString:@"(null)"] && ![self isEqualToString:@"<null>"] && ![self isEqualToString:@" "]) {
		return YES;
	}
	return NO;
}

// 汉字范围
#define MIN_CODE 0x4E00
#define MAX_CODE 0x9FA5
- (BOOL)isHanzi {
	
	unichar ch_chr = [self characterAtIndex:0];
	if (ch_chr >= MIN_CODE && ch_chr <= MAX_CODE) {
		return YES;
	}
	return NO;
}

- (CGSize)sizeConstrainedToSize:(CGSize)size font:(UIFont *)font {
	return [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
}

- (CGFloat)heightConstrainedToSize:(CGSize)size font:(UIFont *)font {
	CGSize result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
	return result.height;
}

- (CGFloat)widthConstrainedToSize:(CGSize)size font:(UIFont *)font {
	CGSize result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
	return result.width;
}

+ (NSString *)intToString:(NSInteger)value {
	
	return [NSString stringWithFormat:@"%ld", (long)value];
}

+ (NSString *)doubleToString:(double)value {
	
	return [NSString stringWithFormat:@"%lf", value];
}

-(NSUInteger)occurenceOfString:(NSString *)substring{
	NSInteger occurence = 0;
	for (int i = 0; i < self.length - substring.length + 1; i++) {
		NSString *str = [self substringWithRange:NSMakeRange(i, substring.length)];
		if ([str isEqualToString:substring]) {
			occurence++;
		}
	}
	return occurence;
}

@end
