//
//  BannerView.m
//  CommunityCircle2
//
//  Created by yangdong on 14-11-18.
//  Copyright (c) 2014年 杨栋. All rights reserved.
//

#import "BannerView.h"
#import "AppInfo.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"

@interface BannerView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSOperationQueue      *networkQueue;
@property (nonatomic, strong) UIImageView           *mBackgroundView;
@property (nonatomic, strong) UIScrollView          *mScrollView;
@property (nonatomic, strong) UIPageControl         *mPageControl;

@property (nonatomic, strong) NSMutableArray        *mPlaceholders;
@property (nonatomic, strong) NSMutableArray        *mUrls;
@property (nonatomic, strong) NSMutableDictionary   *mImageViews;
@property (nonatomic, strong) UIView *gradientView;

@end

@implementation BannerView
@synthesize mScrollView,mPageControl;
@synthesize mPlaceholders,mUrls,mImageViews,mBannerViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = colorWithRGB(236, 236, 236, 1.0f);
        
        self.mBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"默认背景"]];
        
        self.mScrollView = [[UIScrollView alloc] init];
        self.mScrollView.backgroundColor = [UIColor clearColor];
        self.mScrollView.bounces = NO;
        self.mScrollView.pagingEnabled = YES;
        self.mScrollView.delegate = self;
        self.mScrollView.showsHorizontalScrollIndicator = NO;
        self.mScrollView.showsVerticalScrollIndicator = NO;

        self.mPageControl = [[UIPageControl alloc] init];
        self.mPageControl.hidesForSinglePage = YES;
        self.mPageControl.enabled = NO;
        
        self.networkQueue = [[NSOperationQueue alloc] init];
        self.networkQueue.name = @"com.BannerView.queue";
        self.networkQueue.maxConcurrentOperationCount = 3;
        
        self.mPlaceholders = [[NSMutableArray alloc] initWithCapacity:1];
        self.mUrls = [[NSMutableArray alloc] initWithCapacity:1];
        self.mImageViews = [[NSMutableDictionary alloc] initWithCapacity:1];
        
        [self addSubview:self.mBackgroundView];
        [self addSubview:self.mScrollView];
        [self addSubview:self.mPageControl];
        
//        [self setColorGragient];
    }
    return self;
}

- (void)setUrls:(NSArray *)urls withPlaceholderImages:(NSArray *)placeholders
{
    //@"http://www.raywenderlich.com/wp-content/uploads/2014/01/sunny-background.png"
    
    self.mUrls.array = urls;
    self.mPlaceholders.array = placeholders;
    self.mCurrentPage = 0;
    self.mCurrentImageView = nil;
    
    [self.mImageViews removeAllObjects]; 
    
    NSMutableArray *operations = [[NSMutableArray alloc] initWithCapacity:1];
    for (int i=0;i<self.mUrls.count;i++) {
        NSString *url = [self.mUrls objectAtIndex:i];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFImageResponseSerializer serializer];
        [operations addObject:operation];
    }
    
    int acount = 0;
    for (int i=0; i<self.mPlaceholders.count; i++) {
        UIImage *aimage = [UIImage imageNamed:[self.mPlaceholders objectAtIndex:i]];
        if (aimage) {
            UIImageView *aimageView = [[UIImageView alloc] initWithImage:aimage];
            [aimageView setContentMode:UIViewContentModeScaleAspectFit];

            [self.mImageViews setObject:aimageView forKey:[NSNumber numberWithInteger:acount]];
//            UIControl *control = [[UIControl alloc]initWithFrame:self.mCurrentImageView.frame];
//            [control setBackgroundColor:[UIColor blueColor]];
//            [aimageView addSubview:control];
            acount++;
        }
    }
    self.mCurrentImageView = [self.mImageViews objectForKey:[NSString stringWithFormat:@"%ld",(long)self.mCurrentPage]];
    [self relayoutViews:0];
    if (operations.count==0) {
        return;
    }
    
    NSArray *batchOperations =[AFURLConnectionOperation batchOfRequestOperations:operations progressBlock:nil
                                                                 completionBlock:^(NSArray *arr)
    {

        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            int count=0;
            for (int j=0;j<arr.count;j++)
            {
                AFHTTPRequestOperation *operation = [arr objectAtIndex:j];
                UIImage *aimage = operation.responseObject;
                UIImage *placeholder_image = [UIImage imageNamed:[placeholders objectAtIndex:j]];
                if (aimage) {
                    UIImageView *aimageView = [[UIImageView alloc] initWithImage:aimage];
                    [self.mImageViews setObject:aimageView forKey:[NSNumber numberWithInteger:count]];
                    count++;
                }else{
                    if (placeholder_image) {
                        count++;
                    }
                }
            }
            [self relayoutViews:0];
        }];
    }];
    [self.networkQueue addOperations:batchOperations waitUntilFinished:NO];
}
- (void)setColorGragient{
    //    颜色渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [gradient setFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];;
    _gradientView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, gradient.frame.size.width,gradient.frame.size.height)];
    UIColor *colorDark = [UIColor colorWithWhite:0 alpha:1];
    //    UIColor *colorMid = [UIColor colorWithWhite:.1 alpha:.9];
    //    UIColor *colorThird = [UIColor colorWithWhite:.3 alpha:.7];
    //    UIColor *colorLight = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:0];
    UIColor *colorLight = [UIColor colorWithWhite:0 alpha:0];
    gradient.colors = [NSArray arrayWithObjects:(id)colorDark.CGColor,
                       (id)colorLight.CGColor,nil];
    [_gradientView.layer insertSublayer:gradient atIndex:0];
    [self addSubview:_gradientView];
    
}
-(void)relayoutViews:(UIInterfaceOrientation)ainterfaceOrientation
{
    

    self.mBackgroundView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    self.mScrollView.frame = self.bounds;
    NSInteger count = self.mImageViews.count;
    for (;[self.mScrollView subviews].count>0;) {
        UIView *aview = [[self.mScrollView subviews] objectAtIndex:0];
        [aview removeFromSuperview];
        aview = nil;
    }
    NSArray *array = [[self.mImageViews allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (int i=0;i<array.count;i++) {
        UIImageView *aimageview = [self.mImageViews objectForKey:[array objectAtIndex:i]];
        
        aimageview.backgroundColor = [UIColor clearColor];
        aimageview.frame = CGRectMake(i*CGRectGetWidth(self.mScrollView.bounds), CGRectGetMinY(self.mScrollView.bounds), CGRectGetWidth(self.mScrollView.bounds), CGRectGetHeight(self.mScrollView.bounds));
        if (self.mBannerViewDelegate && [self.mBannerViewDelegate respondsToSelector:@selector(appendView:atIndex:)]) {
            
            for (;[aimageview subviews].count>0;) {
                UIView *aview = [[aimageview subviews] objectAtIndex:0];
                [aview removeFromSuperview];
                aview = nil;
            }
            
            [self.mBannerViewDelegate appendView:aimageview atIndex:i];
        }
        [self.mScrollView addSubview:aimageview];
    }
    [self.mScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.mScrollView.bounds)*count, CGRectGetHeight(self.mScrollView.bounds))];
    
    self.mPageControl.numberOfPages = self.mScrollView.subviews.count;
    self.mPageControl.frame = CGRectMake(CGRectGetWidth(self.bounds)/8.0f, CGRectGetMaxY(self.bounds)-30.0f, CGRectGetWidth(self.bounds)*3.0f/4.0f, 11);
}

#pragma mark    Timertask
-(void)startTimer:(NSTimeInterval)timeInterval
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSTimer *mTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:mTimer forMode:NSDefaultRunLoopMode];
        mTimer = nil;
        [[NSRunLoop currentRunLoop] run];
    });
}

-(void)refresh:(NSTimer *)timer
{
    int pageIndex = self.mScrollView.contentOffset.x/CGRectGetWidth(self.bounds);
    pageIndex++;
    if (pageIndex>=self.mScrollView.subviews.count) {
        pageIndex=0;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mPageControl setCurrentPage:pageIndex];
        [self.mScrollView setContentOffset:CGPointMake(pageIndex*CGRectGetWidth(self.bounds), 0) animated:YES];
    });
}

#pragma mark    UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int pageIndex = scrollView.contentOffset.x/CGRectGetWidth(self.bounds);
    [self.mPageControl setCurrentPage:pageIndex];
    self.mCurrentPage = pageIndex;
    self.mCurrentImageView = [self.mImageViews objectForKey:[NSNumber numberWithInteger:pageIndex]];
}

@end
