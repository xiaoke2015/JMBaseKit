//
//  UIViewController+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "UIViewController+JMBaseKit.h"

@implementation UIViewController (JMBaseKit)


- (void)setNavigationBar:(UINavigationBar *)navigationBar {

}

- (UINavigationBar*)navigationBar {
    return self.navigationController.navigationBar;
}


- (void)setBackItemImage:(UIImage *)backItemImage {

    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:backItemImage style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
    self.navigationItem.leftBarButtonItem = item;
}

- (UIImage*)backItemImage {

    return self.navigationItem.leftBarButtonItem.image;
}


- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
 Configure the behavior of adjustedContentInset.
 Default is UIScrollViewContentInsetAdjustmentAutomatic.
 UIScrollView 偏移

 */
- (void)automaticallyAdjustsScrollView:(UIScrollView*)scrollView {

    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}





@end
