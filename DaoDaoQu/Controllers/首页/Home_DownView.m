//
//  Home_DownView.m
//  DaoDaoQu
//
//  Created by Skye.Mango on 16/7/31.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "Home_DownView.h"


#define Line_Width 1

@interface Home_DownView (){
    NSMutableArray *_btnArray;
    NSMutableArray *_imageArray;
    
    
    
}
@property (nonatomic ,strong) UIButton *hotBtn;


@property (nonatomic ,strong) UIButton *row0_firstBtn;
@property (nonatomic ,strong) UIImageView *row0_firstImage;

@property (nonatomic ,strong) UIButton *row0_secondBtn;
@property (nonatomic ,strong) UIImageView *row0_secondImage;

@property (nonatomic ,strong) UIButton *row0_thirdBtn;
@property (nonatomic ,strong) UIImageView *row0_thirdImage;

@property (nonatomic ,strong) UIButton *row0_forthBtn;
@property (nonatomic ,strong) UIImageView *row0_forthImage;

@property (nonatomic ,strong) UIButton *row1_firstBtn;
@property (nonatomic ,strong) UIImageView *row1_firstImage;

@property (nonatomic ,strong) UIButton *row1_secondBtn;
@property (nonatomic ,strong) UIImageView *row1_secondImage;

@property (nonatomic ,strong) UIButton *row1_thirdBtn;
@property (nonatomic ,strong) UIImageView *row1_thirdImage;

@property (nonatomic ,strong) UIButton *row2_firstBtn;
@property (nonatomic ,strong) UIImageView *row2_firstImage;

@property (nonatomic ,strong) UIButton *row2_secondBtn;
@property (nonatomic ,strong) UIImageView *row2_secondImage;

@property (nonatomic ,strong) UIButton *row2_thirdBtn;
@property (nonatomic ,strong) UIImageView *row2_thirdImage;



@end
@implementation Home_DownView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  init...
        
        _btnArray = [[NSMutableArray alloc]init];
        _imageArray = [[NSMutableArray alloc]init];
        
        
        _hotBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        [self addSubview:_hotBtn];
        [_hotBtn setTitle:@"热门产品" forState:UIControlStateNormal];
        [_hotBtn setImage:[UIImage imageNamed:@"_ddq_09"] forState:UIControlStateNormal];
        [_hotBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_hotBtn setTitleColor:colorWithRedColor forState:UIControlStateNormal];
        [_hotBtn setBackgroundColor:[UIColor whiteColor]];
        
        
        
        /******** row 0  ********/
        
        _row0_firstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_hotBtn.frame) + 1, (SCREEN_WIDTH - Line_Width * 3)/4, (SCREEN_WIDTH - Line_Width * 3)/4)];
        _row0_secondBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row0_firstBtn.frame) + 1, _row0_firstBtn.frame.origin.y, _row0_firstBtn.frame.size.width,_row0_firstBtn.frame.size.height)];
        _row0_thirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row0_secondBtn.frame) + 1, _row0_firstBtn.frame.origin.y, _row0_firstBtn.frame.size.width,_row0_firstBtn.frame.size.height)];
        _row0_forthBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row0_thirdBtn.frame) + 1, _row0_firstBtn.frame.origin.y, _row0_firstBtn.frame.size.width,_row0_firstBtn.frame.size.height)];
        
        [self addSubview:_row0_firstBtn];
        [self addSubview:_row0_secondBtn];
        [self addSubview:_row0_thirdBtn];
        [self addSubview:_row0_forthBtn];
        
        [_row0_firstBtn setBackgroundColor:[UIColor whiteColor]];
        [_row0_secondBtn setBackgroundColor:[UIColor whiteColor]];
        [_row0_thirdBtn setBackgroundColor:[UIColor whiteColor]];
        [_row0_forthBtn setBackgroundColor:[UIColor whiteColor]];
        
        
        _row0_firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row0_firstBtn.frame.size.width/4*2, _row0_firstBtn.frame.size.height/4*3)];
        _row0_secondImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row0_firstBtn.frame.size.width/4*2, _row0_firstBtn.frame.size.height/4*3)];
        _row0_thirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row0_firstBtn.frame.size.width/4*2, _row0_firstBtn.frame.size.height/4*3)];
        _row0_forthImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row0_firstBtn.frame.size.width/4*2, _row0_firstBtn.frame.size.height/4*3)];
        
        [_row0_firstImage setCenter:CGPointMake(_row0_firstBtn.frame.size.width/2, _row0_firstBtn.frame.size.height/2)];
        [_row0_secondImage setCenter:CGPointMake(_row0_firstBtn.frame.size.width/2, _row0_firstBtn.frame.size.height/2)];
        [_row0_thirdImage setCenter:CGPointMake(_row0_firstBtn.frame.size.width/2, _row0_firstBtn.frame.size.height/2)];
        [_row0_forthImage setCenter:CGPointMake(_row0_firstBtn.frame.size.width/2, _row0_firstBtn.frame.size.height/2)];
        
        [_row0_firstBtn addSubview:_row0_firstImage];
        [_row0_secondBtn addSubview:_row0_secondImage];
        [_row0_thirdBtn addSubview:_row0_thirdImage];
        [_row0_forthBtn addSubview:_row0_forthImage];

        
        /******** row 1 ********/
        
        _row1_firstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_row0_firstBtn.frame) + 1, (SCREEN_WIDTH - Line_Width*2)/3, (SCREEN_WIDTH - Line_Width*2)/3)];
        _row1_secondBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row1_firstBtn.frame) + 1, CGRectGetMaxY(_row0_firstBtn.frame) + 1, _row1_firstBtn.frame.size.width, _row1_firstBtn.frame.size.height)];
        _row1_thirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row1_secondBtn.frame) + 1, CGRectGetMaxY(_row0_firstBtn.frame) + 1, _row1_firstBtn.frame.size.width, _row1_firstBtn.frame.size.height)];
        
        [self addSubview:_row1_firstBtn];
        [self addSubview:_row1_secondBtn];
        [self addSubview:_row1_thirdBtn];
        
        [_row1_firstBtn setBackgroundColor:[UIColor whiteColor]];
        [_row1_secondBtn setBackgroundColor:[UIColor whiteColor]];
        [_row1_thirdBtn setBackgroundColor:[UIColor whiteColor]];

        _row1_firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row1_firstBtn.frame.size.width, _row1_firstBtn.frame.size.height)];
        _row1_secondImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row1_firstBtn.frame.size.width, _row1_firstBtn.frame.size.height)];
        _row1_thirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row1_firstBtn.frame.size.width, _row1_firstBtn.frame.size.height)];
        
        
        [_row1_firstImage setCenter:CGPointMake(_row1_firstBtn.frame.size.width/2, _row1_firstBtn.frame.size.height/2)];
        [_row1_secondImage setCenter:CGPointMake(_row1_firstBtn.frame.size.width/2, _row1_firstBtn.frame.size.height/2)];
        [_row1_thirdImage setCenter:CGPointMake(_row1_firstBtn.frame.size.width/2, _row1_firstBtn.frame.size.height/2)];

        [_row1_firstBtn addSubview:_row1_firstImage];
        [_row1_secondBtn addSubview:_row1_secondImage];
        [_row1_thirdBtn addSubview:_row1_thirdImage];

        
        /******** row 2 ********/
        
        _row2_firstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_row1_firstBtn.frame) + 1, (SCREEN_WIDTH - Line_Width*2)/3, (SCREEN_WIDTH - Line_Width*2)/3)];
        _row2_secondBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row2_firstBtn.frame) + 1, CGRectGetMaxY(_row1_firstBtn.frame) + 1, _row2_firstBtn.frame.size.width, _row2_firstBtn.frame.size.height)];
        _row2_thirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_row2_secondBtn.frame) + 1, CGRectGetMaxY(_row1_firstBtn.frame) + 1, _row2_firstBtn.frame.size.width, _row2_firstBtn.frame.size.height)];
        
        [self addSubview:_row2_firstBtn];
        [self addSubview:_row2_secondBtn];
        [self addSubview:_row2_thirdBtn];
        
        [_row2_firstBtn setBackgroundColor:[UIColor whiteColor]];
        [_row2_secondBtn setBackgroundColor:[UIColor whiteColor]];
        [_row2_thirdBtn setBackgroundColor:[UIColor whiteColor]];

        
        _row2_firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row2_firstBtn.frame.size.width, _row2_firstBtn.frame.size.height)];
        _row2_secondImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row2_firstBtn.frame.size.width, _row2_firstBtn.frame.size.height)];
        _row2_thirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _row2_firstBtn.frame.size.width, _row2_firstBtn.frame.size.height)];
        
        
        [_row2_firstImage setCenter:CGPointMake(_row2_firstBtn.frame.size.width/2, _row2_firstBtn.frame.size.height/2)];
        [_row2_secondImage setCenter:CGPointMake(_row2_firstBtn.frame.size.width/2, _row2_firstBtn.frame.size.height/2)];
        [_row2_thirdImage setCenter:CGPointMake(_row2_firstBtn.frame.size.width/2, _row2_firstBtn.frame.size.height/2)];
        
        [_row2_firstBtn addSubview:_row2_firstImage];
        [_row2_secondBtn addSubview:_row2_secondImage];
        [_row2_thirdBtn addSubview:_row2_thirdImage];

        
        
        /******** ***** ********/
        
        [_btnArray addObject:_row0_firstBtn];
        [_btnArray addObject:_row0_secondBtn];
        [_btnArray addObject:_row0_thirdBtn];
        [_btnArray addObject:_row0_forthBtn];
        [_btnArray addObject:_row1_firstBtn];
        [_btnArray addObject:_row1_secondBtn];
        [_btnArray addObject:_row1_thirdBtn];
        [_btnArray addObject:_row2_firstBtn];
        [_btnArray addObject:_row2_secondBtn];
        [_btnArray addObject:_row2_thirdBtn];

        [_imageArray addObject:_row0_firstImage];
        [_imageArray addObject:_row0_secondImage];
        [_imageArray addObject:_row0_thirdImage];
        [_imageArray addObject:_row0_forthImage];
        [_imageArray addObject:_row1_firstImage];
        [_imageArray addObject:_row1_secondImage];
        [_imageArray addObject:_row1_thirdImage];
        [_imageArray addObject:_row2_firstImage];
        [_imageArray addObject:_row2_secondImage];
        [_imageArray addObject:_row2_thirdImage];

        
        _viewHeight = CGRectGetMaxY([[_btnArray lastObject] frame]);
        
    }
    return self;
}

- (void)setDataWithUI:(NSMutableArray *)array{
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSInteger i = 9; i >= 0 ; i--) {
        [arr addObject:[array objectAtIndex:i]];
    }
    
    
    for (NSInteger i = 0; i < arr.count; i++) {
        
        [[_imageArray objectAtIndex:i] setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:i] objectForKey:@"picture"]]] placeholderImage:nil];
    }
    
//    [_row0_firstImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:0] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row0_secondImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:1] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row0_thirdImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:2] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row0_forthImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:3] objectForKey:@"picture"]]] placeholderImage:nil];
//    
//    [_row1_firstImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:4] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row1_secondImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:5] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row1_thirdImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:6] objectForKey:@"picture"]]] placeholderImage:nil];
//    
//    [_row2_firstImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:7] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row2_secondImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:8] objectForKey:@"picture"]]] placeholderImage:nil];
//    [_row2_thirdImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:9] objectForKey:@"picture"]]] placeholderImage:nil];
//    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
