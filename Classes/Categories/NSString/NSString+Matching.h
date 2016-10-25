//
//  NSString+Matching.h
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Matching)

// 检测字符串是否是手机号码
- (BOOL)isMobileNumber;

// 号码是否可用
- (BOOL)isAvailableNumber;

// 去掉+86 变成标准的号码
- (NSString *)handleStandardMobileNumber;

// 是否为E-mail地址
- (BOOL)isValidEmail;

@end
