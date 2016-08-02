//
//  DTNavigationController.m
//  MyNavigation
//
//  Created by silentcloud on 14-1-1.
//  Copyright (c) 2014年 iHope. All rights reserved.
//

#import "DTNavigationController.h"
#import <QuartzCore/QuartzCore.h>

//window窗口
#define WINDOW  [[UIApplication sharedApplication] keyWindow]
#define SCREEN_VIEW_WIDTH  self.view.bounds.size.width

static const float kDurationTime = 0.3;
static const float kScaleValue = 0.95;

@interface DTNavigationController ()
{
    CGPoint startTouch; //拖动开始时位置
    BOOL isMoving;      //是否在拖动中
    
    UIView *blackMask;
    //The snapshot
    UIImageView *lastScreenShotView;
}
@property (nonatomic,retain) UIView *backgroundView;//背景
@property (nonatomic,retain) NSMutableArray *screenShotsList;//存截
@end

@implementation DTNavigationController

- (id)init
{
    self = [self init];
    if (self) {
        // 只少2个 头一个肯定是顶级的界面
        self.screenShotsList = [[NSMutableArray alloc]initWithCapacity:2];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.screenShotsList = [[NSMutableArray alloc]initWithCapacity:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    isMoving = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if ([self.view window] == nil) {
        self.view = nil;
    }
    // Dispose of any resources that can be recreated.
}

@end
