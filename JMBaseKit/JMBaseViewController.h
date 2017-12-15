//
//  JMBaseViewController.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMBaseViewController : UIViewController


// navi 标题视图
@property (nonatomic ,strong) UIView * customView;
// navi 左侧视图 常用UIButton
@property (nonatomic ,strong) UIButton * leftItemBtn;
// navi 右侧视图 常用UIButton
@property (nonatomic ,strong) UIButton * rightItemBtn;

@property (nonatomic ,assign) CGFloat itemMargin;


- (void)initNaviBarBtn:(NSString*)title ;

@end
