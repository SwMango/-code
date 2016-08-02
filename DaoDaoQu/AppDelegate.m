//
//  AppDelegate.m
//  DaoDaoQu
//
//  Created by MangO on 16/7/26.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DTNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    
    DTNavigationController * rootNav = [[DTNavigationController alloc]initWithRootViewController:homeVC];

    [self customizeInterface];
    [self.window setRootViewController:rootNav];

    
    
    
    return YES;
}
- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:10 forBarMetrics:UIBarMetricsDefaultPrompt];
    //    UIImage *backgroundImage = nil;
    
    NSDictionary *textAttributes = nil;
    textAttributes = @{
                       NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
                       NSForegroundColorAttributeName: [UIColor whiteColor],
                       };
    
    
    
    //设置导航图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    //    [imageView setImage:[UIImage imageNamed:@"导航"]];
    //
    //    backgroundImage = [UIImage imageNamed:@"导航"];
    
    [navigationBarAppearance setBackgroundImage:imageView.image forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBackgroundColor:colorWithRGB(242.0, 242.0, 242.0, 1.0)];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
