//
//  UIViewController+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/14.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "UIViewController+JMBaseKit.h"

#import "UIImage+JMKit.h"

@implementation UIViewController (JMBaseKit)


- (void)jm_setBackItemTitle:(NSString*)title {

    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(backItemAction)];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)jm_setBackItemImage:(NSString*)image {
    
    UIImage *img = [UIImage imageNamed:image];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(backItemAction)];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = item;
}


- (void)backItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}

// 设置 NavigationBar 底部线颜色 可以设置无色
- (void)jm_setShadowColor:(UIColor*)color {
    UIImage *image = [UIImage imageWithColor:color size:CGSizeMake(1, 0.5)];
    [self.navigationController.navigationBar setShadowImage:image];
}

// 设置 NavigationBar 背景颜色 设置无色为白色
- (void)jm_setBarTintColor:(UIColor*)color {
    self.navigationController.navigationBar.barTintColor = color;
}

- (void)jm_setTitleColor:(UIColor*)color {
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:color};
}

- (void)jm_setTitleFont:(UIFont*)font {
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:font};
}



- (void)jm_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:hidden animated:animated];
}





@end
