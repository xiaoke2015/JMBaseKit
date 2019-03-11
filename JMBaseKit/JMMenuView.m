//
//  JMMenuView.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/3/11.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "JMMenuView.h"

@implementation JMMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}


- (void)setup {

    _edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    _minimumLineSpacing = 0;
    _minimumInteritemSpacing = 0;
    _textColor = [UIColor blackColor];
    _textFont = [UIFont systemFontOfSize:15];

    _maxRow = 4;
    _maxColumn = 1;

}



- (void)drawMenu {


    NSInteger count = self.titles.count;


    CGFloat x = _edgeInsets.left;
    CGFloat y = _edgeInsets.top;
    CGFloat w = (CGRectGetWidth(self.frame) - _edgeInsets.left - _edgeInsets.right - _minimumInteritemSpacing*(_maxRow - 1))/_maxRow;
    CGFloat h = (CGRectGetHeight(self.frame) - _edgeInsets.top - _edgeInsets.bottom - _minimumLineSpacing*(_maxColumn - 1))/_maxColumn;


    for(int i=0;i<count;i++){

        CGFloat x1 = x + (w+_minimumInteritemSpacing)*(i%_maxRow);
        CGFloat y1 = y + (h+_minimumLineSpacing)*(i/_maxRow);

        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x1, y1, w, h)];

        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn setImage:self.images[i] forState:UIControlStateNormal];
        [btn setImage:self.images[i] forState:UIControlStateHighlighted];
        [btn setTitleColor:self.textColor forState:UIControlStateNormal];
        btn.titleLabel.font = self.textFont;

        [self addSubview:btn];
        [btn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self adjustButtonImageViewUPTitleDownWithButton:btn];

        btn.tag = 20000 + i;
    }
}


- (void)menuBtnAction:(UIButton*)btn {

    NSInteger tag = btn.tag - 20000;

    if(_didSelBlock != nil){
        _didSelBlock(tag);
    }
}




- (void)adjustButtonImageViewUPTitleDownWithButton:(UIButton *)focusBtn {
    
    focusBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [focusBtn setTitleEdgeInsets:UIEdgeInsetsMake(focusBtn.imageView.frame.size.height ,-focusBtn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [focusBtn setImageEdgeInsets:UIEdgeInsetsMake(-focusBtn.imageView.frame.size.height, 0.0,0.0, -focusBtn.titleLabel.bounds.size.width)];

}




@end
