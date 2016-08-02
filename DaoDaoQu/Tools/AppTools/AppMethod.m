//
//  AppMethod.m
//  CallMe
//
//  Created by Justin on 16/7/22.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "AppMethod.h"

@implementation AppMethod

+ (CGSize)StringSize:(NSString *)str with:(UIFont *)font with:(int)mode with:(CGSize)size
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if (IOS7_OR_LATER) {
        NSDictionary *attribute = @{NSFontAttributeName: font};
        return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    }
#endif
    //        return [str sizeWithFont:font constrainedToSize:size lineBreakMode:mode];
    return CGSizeMake(0, 0);
}
+ (CGSize)StringSize:(NSString *)str with:(UIFont *)font with:(int)mode
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if (IOS7_OR_LATER) {
        NSDictionary *attribute = @{NSFontAttributeName: font};
        return [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    }
#endif
    //        return [str sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT,MAXFLOAT) lineBreakMode:mode];
    return CGSizeMake(0, 0);
}


#pragma mark Navigation

+(UIView *)creatNavBarFromViewController:(UIViewController *)fromViewController withTitle:(NSString *)title
{
    UINavigationBar *bar = [[UINavigationBar alloc]init];
    //    [bar setAlpha:0.0];
    if (IOS7_OR_LATER) {
        bar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HEIGHT_TITLE);
    }
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:title];
    [bar pushNavigationItem:item animated:NO];
    [fromViewController.view addSubview:bar];
    [bar setHidden:YES];
    
    UIView *_navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT_TITLE)];
    [_navView setBackgroundColor:colorWithBlueColor];
    
    UILabel *_titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    [_navView addSubview:_titleLabel];
    [_titleLabel setText:title];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
    
    return _navView;
}
#pragma mark - 本地持久化
+ (void)writeDocWithDoc:(id)doc fileName:(NSString *)fileName{
    
    NSArray * docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString * documentsPath = [docPath objectAtIndex:0];
    NSString * filePathDong=[documentsPath stringByAppendingPathComponent:fileName];
    NSFileManager * fileManagerDong = [NSFileManager defaultManager];
    if ([fileManagerDong fileExistsAtPath:filePathDong] == YES) {
        //        [self removeDocLocationWithFileName:fileName];
    }else{
        
    }
    NSArray *fileArray = [NSArray arrayWithObjects:doc, nil];
    [fileArray writeToFile:filePathDong atomically:NO];
}
+ (id)getDocFileWithFileName:(NSString *)fileName{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSString * readPath2 = [documentsPath stringByAppendingPathComponent:fileName];
    NSArray * fileContent2 = [[NSArray alloc] initWithContentsOfFile:readPath2];
    //    NSString *cityCodeStr = [fileContent2 objectAtIndex:0];
    
    return [fileContent2 firstObject];
}
+ (BOOL)isHaveDocWithFileName:(NSString *)fileName{
    BOOL isExcit;
    
    NSDictionary *dic = [AppMethod getDocFileWithFileName:fileName];
    if ([[dic objectForKey:@"file"] count] != 0 || [[dic allKeys] count] != 0) {
        isExcit = YES;
    }else{
        isExcit = NO;
    }
    
    return isExcit;
}
+ (void)removeDocLocationWithFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *dataPath2 = [documentsDirectory stringByAppendingPathComponent:fileName];
    BOOL bRet2 = [fileMgr fileExistsAtPath:dataPath2];
    if (bRet2) {
        NSError *err;
        [fileMgr removeItemAtPath:dataPath2 error:&err];
    }
    
}
+(UIColor *) randomColor

{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}

+(UIColor *) lightRandomColor

{
    
    CGFloat hue = ( arc4random() % 128 / 256.0 ) + 0.5; //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}


@end
