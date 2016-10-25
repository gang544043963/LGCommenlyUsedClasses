//
//  NSString+Matching.m
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import "NSString+Matching.h"

@implementation NSString (Matching)

- (BOOL)isMobileNumber {
	NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,1-3,5-9]))\\d{8}$";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	return [pred evaluateWithObject:self];
}

- (BOOL)isAvailableNumber {//首字母是1的 11位数字
	NSString *regex = @"^1\\d{10}$";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	return [pred evaluateWithObject:self];
}

- (NSString *)handleStandardMobileNumber {
	
	NSString *tempStr0 = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
	NSString *tempStr1 = [tempStr0 stringByReplacingOccurrencesOfString:@" " withString:@""];
	NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"(" withString:@""];
	NSString *tempStr3 = [tempStr2 stringByReplacingOccurrencesOfString:@")" withString:@""];
	
	// 去掉+86/86
	if (tempStr3.length > 2) {
		NSString *tempStr4 = [tempStr3 substringToIndex:2];
		if ([tempStr4 isEqualToString:@"86"]) {
			return [tempStr3 substringFromIndex:2];
		}
	}
 
	NSString *tempStr5 = [tempStr3 stringByReplacingOccurrencesOfString:@"+86" withString:@""];
	return tempStr5;
}

- (BOOL)isValidEmail {
	BOOL stricterFilter = YES;
	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:self];
}

@end
