//
//  Home_BtnView.m
//  DaoDaoQu
//
//  Created by Skye.Mango on 16/7/31.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "Home_BtnView.h"

@interface Home_BtnView (){
    
}

@property (nonatomic ,strong) UIImageView *firstImage;
@property (nonatomic ,strong) UIImageView *secondImage;
@property (nonatomic ,strong) UIImageView *thirdImage;
@property (nonatomic ,strong) UIImageView *forthImage;


@end
@implementation Home_BtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  init...
        
        _firstBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_WIDTH - 10*2)/4, (SCREEN_WIDTH - 10*2)/4)];
         _secondBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_firstBtn.frame), 0, _firstBtn.frame.size.width, _firstBtn.frame.size.height)];
         _thirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_secondBtn.frame), 0, _secondBtn.frame.size.width, _secondBtn.frame.size.height)];
         _forthBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_thirdBtn.frame), 0, _thirdBtn.frame.size.width, _thirdBtn.frame.size.height)];
        
        
        
        _firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _firstBtn.frame.size.width *3/4 * 170/236, _firstBtn.frame.size.width *3/4)];
        _secondImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _firstImage.frame.size.width, _firstImage.frame.size.height)];
        _thirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _firstImage.frame.size.width, _firstImage.frame.size.height)];
        _forthImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _firstImage.frame.size.width, _firstImage.frame.size.height)];
        
        [_firstImage setCenter:CGPointMake(_firstBtn.frame.size.width/2, _firstBtn.frame.size.height/2)];
        [_secondImage setCenter:CGPointMake(_firstBtn.frame.size.width/2, _firstBtn.frame.size.height/2)];
        [_thirdImage setCenter:CGPointMake(_firstBtn.frame.size.width/2, _firstBtn.frame.size.height/2)];
        [_forthImage setCenter:CGPointMake(_firstBtn.frame.size.width/2, _firstBtn.frame.size.height/2)];
        
        
        
        [self addSubview:_firstBtn];
        [self addSubview:_secondBtn];
        [self addSubview:_thirdBtn];
        [self addSubview:_forthBtn];
        [_firstBtn addSubview:_firstImage];
        [_secondBtn addSubview:_secondImage];
        [_thirdBtn addSubview:_thirdImage];
        [_forthBtn addSubview:_forthImage];
        
        
        
        [_firstBtn setTag:0];
        [_secondBtn setTag:1];
        [_thirdBtn setTag:2];
        [_forthBtn setTag:3];
        
        _viewHeight = CGRectGetMaxY(_firstBtn.frame);
        
        
    }
    return self;
}

- (void)setDataWithUI:(NSMutableArray *)array{
    
    [_firstImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[array objectAtIndex:array.count-1] objectForKey:@"picture"]]] placeholderImage:nil];
    
    [_secondImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[array objectAtIndex:array.count-2] objectForKey:@"picture"]]] placeholderImage:nil];
    
    [_thirdImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[array objectAtIndex:array.count-3] objectForKey:@"picture"]]] placeholderImage:nil];
    
    [_forthImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[array objectAtIndex:array.count-4] objectForKey:@"picture"]]] placeholderImage:nil];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
