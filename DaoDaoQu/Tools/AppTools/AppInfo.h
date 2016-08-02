//
//  AppInfo.h
//  CallMe
//
//  Created by Justin on 16/7/22.
//  Copyright © 2016年 Justin. All rights reserved.
//

#ifndef AppInfo_h
#define AppInfo_h


#endif /* AppInfo_h */

#import "AppMethod.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"



#define KeyWindow [[UIApplication sharedApplication]keyWindow]

#define NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define IOS8_OR_LATER NLSystemVersionGreaterOrEqualThan(8.0)
#define IOS7_OR_LATER NLSystemVersionGreaterOrEqualThan(7.0)
#define IOS6_OR_LATER NLSystemVersionGreaterOrEqualThan(6.0)
#define ISIOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >=7
#define ISIOS6_OR_EARLY [[[UIDevice currentDevice] systemVersion] floatValue] < 7


#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define HEIGHT_TITLE            64.0f
#define HEIGHT_TOOLSBAR         49.0f


#define colorWithRGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define colorWithBackColor colorWithRGB(245,245,245,1)  //背景底色RGB:245/245/245

#define colorWithBlueColor colorWithRGB(91,133,231,1)   //蓝色RGB:91/133/231

#define colorWithRedColor colorWithRGB(247,44,46,1) //红色RGB:247/44/46

#define colorWithBigTitleColor colorWithRGB(102,102,102,1)  //大图标字色RGB:102/102/102

#define colorWithLittleTitleColor colorWithRGB(170,170,170,1)   //小图标字色RGB:170/170/170

#define colorWithBorderColor colorWithRGB(232,232,232,1)    //边框RGB:232/232/232


/******** 接口 ********/
#define Base_Url @"http://www.daodaoqu.com.cn/ddg"  // base接口

/* 获取首页图片 */
#define home_url [NSString stringWithFormat:@"%@/p/get_index_picture.php",Base_Url]

//   获取手机验证码 //sendSMS=phone
#define phoneCode_url [NSString stringWithFormat:@"%@/p/user.php",Base_Url]

//   登录接口 //
#define login_url   [NSString stringWithFormat:@"%@/p/get_index_picture.php",Base_Url]





