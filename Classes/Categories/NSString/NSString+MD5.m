//
//  NSString+MD5.m
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/25.
//  Copyright © 2016年 LG. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)

- (NSString *)MD5String {
	const char* str = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	uint32_t length = strlen(str);
	CC_MD5(str, length, result);
	NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
	
	return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			 result[0], result[1], result[2], result[3],
			 result[4], result[5], result[6], result[7],
			 result[8], result[9], result[10], result[11],
			 result[12], result[13], result[14], result[15]
			 ] lowercaseString];
	return ret;
}

- (NSString *)stringFromMD5{
	
	if(self == nil || [self length] == 0)
		return nil;
	
	const char *value = [self UTF8String];
	
	unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
	CC_MD5(value, strlen(value), outputBuffer);
	
	NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
		[outputString appendFormat:@"%02x",outputBuffer[count]];
	}
	
	return outputString;
}

@end
