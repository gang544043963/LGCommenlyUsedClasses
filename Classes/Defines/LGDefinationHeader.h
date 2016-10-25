//
//  LGDefinationHeader.h
//  LGCommenlyUsedClasses
//
//  Created by ligang on 16/10/24.
//  Copyright © 2016年 LG. All rights reserved.
//

#ifndef LGDefinationHeader_h
#define LGDefinationHeader_h

// 1.获取屏幕尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

// 2.沙盒
// 沙盒Document路径
#define DocumentPath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// 获取temp
#define TempPath NSTemporaryDirectory()
// 获取沙盒 Cache
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 3.一些固定尺寸
#define HEIGHT_TAB_BAR 49.0f
#define HEIGHT_STATUS_BAR 20.0f
#define HEIGHT_NAV_BAR 44.0f
#define HEIGHT_NAV_STATUS_BAR 64.0f

// 4.颜色
#define UIColorFromRGBOne(x)  [UIColor colorWithRed:x/255.0 green:x/255.0 blue:x/255.0 alpha:1.0]
#define UIColorFromRGB(x, y, z)  [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]
#define UIColorFromRGBA(r, g, b, a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define LGRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// 5.获取图片
#define GetImage(imageName)  [UIImage imageNamed:imageName]

// 6.一个简洁高效的log
#ifdef DEBUG
#define NSLog(format, ...) \
do { \
NSLog(@"<%@ : %d : %s>-: %@", \
[[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
__LINE__, \
__FUNCTION__, \
[NSString stringWithFormat:format, ##__VA_ARGS__]); \
} while(0)
#else
#define NSLog(format, ...) do{ } while(0)
#endif


// 7.获取本地字符串，用于语言国际化
#define LGLocalizedString(key)  NSLocalizedStringFromTable(key, @"Localizations", @"")

// 8.weakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 9.字体
#define GetFont(x) [UIFont systemFontOfSize:x]
#define GetBoldFont(x) [UIFont boldSystemFontOfSize:x]

// 10.获取系统版本号
#define SysVer [[[UIDevice currentDevice] systemVersion] floatValue]

// 11.判断iOS系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// 12.判断当前的iPhone设备/系统版本
// 判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 13.判断设备
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

// 14.由角度转换弧度 由弧度转换角度
#define LGDegreesToRadian(x) (M_PI * (x) / 180.0)
#define LGRadianToDegrees(radian) (radian*180.0)/(M_PI)

#endif /* LGDefinationHeader_h */
