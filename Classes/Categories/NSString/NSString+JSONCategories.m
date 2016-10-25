//
//  NSString+JSONCategories.m
//  XinGe
//
//  Created by zhilin duan on 10/31/15.
//  Copyright © 2015 Tomy. All rights reserved.
//

#import "NSString+JSONCategories.h"

@implementation NSString (JSONCategories)
-(id)JSONValue
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

-(id)objectFromJSONString
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
