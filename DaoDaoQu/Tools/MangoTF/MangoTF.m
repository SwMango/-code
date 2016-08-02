//
//  MangoTF.m
//  yuebao
//
//  Created by mango on 16/3/8.
//  Copyright © 2016年 mango. All rights reserved.
//

#import "MangoTF.h"

@interface MangoTF (){
    
}

@end
@implementation MangoTF
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  init...
        
        [self setLeftViewMode:UITextFieldViewModeAlways];
        [self setLeftView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, frame.size.height)]];
        _subLeft = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.leftView.frame.size.width - 10, frame.size.height)];
        [self.leftView addSubview:_subLeft];
        [_subLeft setFont:[UIFont systemFontOfSize:15]];
        [_subLeft setTextColor:colorWithRGB(57, 57, 57, 1)];
        
        [self setTextColor:colorWithRGB(57, 57, 57, 1)];
        [self setFont:[UIFont systemFontOfSize:13]];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
