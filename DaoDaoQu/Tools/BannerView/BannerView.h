//
//  BannerView.h
//  CommunityCircle2
//
//  Created by yangdong on 14-11-18.
//  Copyright (c) 2014年 杨栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerViewDelegate <NSObject>

- (void)appendView:(UIImageView *)imageView atIndex:(int)index;

@end

@interface BannerView : UIView
@property (nonatomic, assign)id<BannerViewDelegate> mBannerViewDelegate;
@property (nonatomic, assign)NSInteger              mCurrentPage;
@property (nonatomic, assign)UIImageView            *mCurrentImageView;

- (void)setUrls:(NSArray *)urls withPlaceholderImages:(NSArray *)placeholders;
- (void)startTimer:(NSTimeInterval)timeInterval;
-(void)relayoutViews:(UIInterfaceOrientation)ainterfaceOrientation;
@end
