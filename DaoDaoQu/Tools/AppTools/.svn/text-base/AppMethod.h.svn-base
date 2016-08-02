//
//  AppMethod.h
//  CallMe
//
//  Created by Justin on 16/7/22.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppInfo.h"


@interface AppMethod : NSObject

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 根据文字自动算宽度(高度)   //自适应//  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+ (CGSize)StringSize:(NSString *)str with:(UIFont *)font with:(int)mode;
+ (CGSize)StringSize:(NSString *)str with:(UIFont *)font with:(int)mode with:(CGSize)size;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 创建 navbar ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+(UIView *)creatNavBarFromViewController:(UIViewController *)fromViewController withTitle:(NSString *)title;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 本地数据库-写 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+ (void)writeDocWithDoc:(id)doc fileName:(NSString *)fileName;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 本地数据库-查 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+ (id)getDocFileWithFileName:(NSString *)fileName;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 本地数据库-删 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+ (void)removeDocLocationWithFileName:(NSString *)fileName;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 检测本地是否有文件 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+ (BOOL)isHaveDocWithFileName:(NSString *)fileName;

/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 随机色 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
+(UIColor *) randomColor;



@end
