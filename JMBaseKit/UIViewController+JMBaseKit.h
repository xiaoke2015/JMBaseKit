//
//  UIViewController+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/14.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const JMBackItemImage = @"item_back";
static NSString * const JMBackItemTitle = @"返回";


@interface UIViewController (JMBaseKit)


// 设置 NavigationBar 返回图片
- (void)jm_setBackItemImage:(NSString*)image ;
// 设置 NavigationBar 返回文字
- (void)jm_setBackItemTitle:(NSString*)title ;


// 设置 NavigationBar 底部线颜色 可以设置无色
- (void)jm_setShadowColor:(UIColor*)color ;

// 设置 NavigationBar 背景颜色 设置无色为白色
- (void)jm_setBarTintColor:(UIColor*)color ;

// 设置 NavigationBar 标题颜色
- (void)jm_setTitleColor:(UIColor*)color ;

// 设置 NavigationBar 标题字体
- (void)jm_setTitleFont:(UIFont*)font ;

@end
