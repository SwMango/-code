//
//  HomeViewController.m
//  DaoDaoQu
//
//  Created by Skye.Mango on 16/7/30.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerView.h"
#import "Home_BtnView.h"
#import "Home_DownView.h"


@interface HomeViewController ()<BannerViewDelegate>{
    
    UIScrollView *_backView;
    
    UIButton *_carBtn;  // + 添加我的爱车
    
    BannerView *_bannerView;    //banner
    NSMutableArray *_bannerArray;
    NSMutableDictionary *_homeDataDic;
    
    Home_BtnView *_btnView;
    
    Home_DownView *_downView;
    
}

@end

@implementation HomeViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        //  init...
        _bannerArray = [[NSMutableArray alloc]init];
        _homeDataDic = [[NSMutableDictionary alloc]init];
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
    [self createNavBar];
    
    [self initWithBackView];
    [self initWithCarBtn];
    [self initWithBanner];
    [self initWithBtnView];
    [self initWithDownView];
    
    [self request_home];
    
}
#pragma mark - Nav
- (void)createNavBar{
    UIView *navView = [AppMethod creatNavBarFromViewController:self withTitle:@"道道去"];
    [self.view addSubview:navView];
    
    UIButton *_nav_leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 25, 90, 34)];
    [navView addSubview:_nav_leftBtn];
    [_nav_leftBtn setImage:[UIImage imageNamed:@"_ddq_01"] forState:UIControlStateNormal];
    [_nav_leftBtn setTitle:@" 沈阳市 " forState:UIControlStateNormal];
    [_nav_leftBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    UIButton *_nav_rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 65, 25, 60, 34)];
    [navView addSubview:_nav_rightBtn];
    [_nav_rightBtn setTitle:@"  我的" forState:UIControlStateNormal];
    [_nav_rightBtn setImage:[UIImage imageNamed:@"_ddq_02"] forState:UIControlStateNormal];
    [_nav_rightBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
}


#pragma mark - Init
- (void)initWithBackView{
    _backView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HEIGHT_TITLE, SCREEN_WIDTH, SCREEN_HEIGHT - HEIGHT_TITLE)];
    [self.view addSubview:_backView];
    [_backView setBackgroundColor:colorWithBackColor];
}
- (void)initWithCarBtn{
    _carBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    [_backView addSubview:_carBtn];
    [_carBtn setTitle:@"+ 添加我的爱车" forState:UIControlStateNormal];
    [_carBtn setBackgroundColor:colorWithBlueColor];
    [_carBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
}
- (void)initWithBanner{
    _bannerView = [[BannerView alloc] initWithFrame:CGRectZero];
    [_bannerView setFrame:CGRectMake(0, CGRectGetMaxY(_carBtn.frame), SCREEN_WIDTH, SCREEN_WIDTH /2)];
    [_bannerView setUserInteractionEnabled:YES];
    [_bannerView.mCurrentImageView setUserInteractionEnabled:YES];
    [_bannerView startTimer:3.0f];
    _bannerView.mBannerViewDelegate = self;
    [_backView addSubview:_bannerView];
    
    
}
- (void)initWithBtnView{
    _btnView = [[Home_BtnView alloc]init];
    [_backView addSubview:_btnView];
    [_btnView setBackgroundColor:[UIColor whiteColor]];
    [_btnView setFrame:CGRectMake(0, CGRectGetMaxY(_bannerView.frame) + 10, SCREEN_WIDTH, _btnView.viewHeight)];
    
    
}
- (void)initWithDownView{
    _downView = [[Home_DownView alloc]init];
    [_backView addSubview:_downView];
    [_downView setBackgroundColor:colorWithBackColor];
    
    [_downView setFrame:CGRectMake(0, CGRectGetMaxY(_btnView.frame) + 10, SCREEN_WIDTH, _downView.viewHeight)];
    
    
    [_backView setContentSize:CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_downView.frame))];
}
#pragma mark - Data
- (void)setData_BannerView{
    [_bannerArray removeAllObjects];
    
    for (NSInteger i = 0; i < [[_homeDataDic objectForKey:@"lunbo"] count]; i++) {
        [_bannerArray addObject:[[[_homeDataDic objectForKey:@"lunbo"] objectAtIndex:i] objectForKey:@"picture"]]
        ;
    }
    [_bannerView setUrls:_bannerArray withPlaceholderImages:nil];

}
- (void)setData_BtnView{
    [_btnView setDataWithUI:[_homeDataDic objectForKey:@"other"]];
    
}
- (void)setData_DownView{
    [_downView setDataWithUI:[_homeDataDic objectForKey:@"other"]];
    
}
#pragma mark - Action
#pragma mark - Request
- (void)request_home{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *requestStr = home_url;
    
    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:requestStr parameters:postDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"responseObject=%@",responseObject);
            //  返回成功
            [_homeDataDic removeAllObjects];
            [_homeDataDic addEntriesFromDictionary:responseObject];
        
        if ([[_homeDataDic allKeys] count] != 0) {
            [self setData_BannerView];
            [self setData_BtnView];
            [self setData_DownView];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"%@",error);
    }];
}
#pragma mark - Delegate
- (void)appendView:(UIImageView *)imageView atIndex:(int)index{
    NSLog(@"index:%d",index);
}
#pragma mark - Noti
#pragma mark - View
- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
}
#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
