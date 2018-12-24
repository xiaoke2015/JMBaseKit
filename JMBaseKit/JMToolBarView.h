//
//  JMToolBarView.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/8/30.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMToolBarView : UIView

@property (nonatomic ,strong)UILabel * title;
@property (nonatomic ,strong)UIButton * leftBtn;
@property (nonatomic ,strong)UIButton * rightBtn;

@property (nonatomic ,copy)void (^leftBtnBlock)(JMToolBarView * toolBarView);
@property (nonatomic ,copy)void (^rightBtnBlock)(JMToolBarView * toolBarView);

@end
