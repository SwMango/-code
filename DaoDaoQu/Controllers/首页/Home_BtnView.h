//
//  Home_BtnView.h
//  DaoDaoQu
//
//  Created by Skye.Mango on 16/7/31.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_BtnView : UIView


@property (nonatomic ,strong) UIButton *firstBtn;
@property (nonatomic ,strong) UIButton *secondBtn;
@property (nonatomic ,strong) UIButton *thirdBtn;
@property (nonatomic ,strong) UIButton *forthBtn;

@property (nonatomic ,assign) CGFloat viewHeight;



- (void)setDataWithUI:(NSMutableArray *)array;


@end
