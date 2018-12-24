//
//  JMToolBarView.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/8/30.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "JMToolBarView.h"

#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1]
#define FONT(x) [UIFont systemFontOfSize:x]


@interface JMToolBarView ()

@property (nonatomic ,assign)CGFloat toolWidth;

@end


@implementation JMToolBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.toolWidth = 66;
    [self creatView];
    return self;
}


- (void)creatView {
    
    CGFloat w = _toolWidth;
    
    _title = [[UILabel alloc]initWithFrame:self.bounds];
    _title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_title];
    _title.font = FONT(15);
    _title.textColor = RGB(51, 51, 51);
    _title.backgroundColor = RGB(237, 237, 237);
    
    _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, CGRectGetHeight(self.frame))];
    [_leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = FONT(14);
    [self addSubview:_leftBtn];
    
    _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - w, 0, w, CGRectGetHeight(self.frame))];
    [_rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:RGB(42, 165, 231) forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = FONT(14);
    [self addSubview:_rightBtn];
    
    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
}



- (void)leftBtnAction {
    
    if(_leftBtnBlock != nil){
        _leftBtnBlock(self);
    }
}


- (void)rightBtnAction {
    
    if(_rightBtnBlock != nil){
        _rightBtnBlock(self);
    }
}

@end
