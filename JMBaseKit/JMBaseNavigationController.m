//
//  JMBaseNavigationController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import "JMBaseNavigationController.h"

@interface JMBaseNavigationController ()
< UINavigationControllerDelegate ,
 UIGestureRecognizerDelegate >

@end

@implementation JMBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    //   swipe gesture
    __weak typeof (self) weak = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //        self.interactivePopGestureRecognizer.enabled = YES;
        /* UIGestureRecognizerDelegate */
        self.interactivePopGestureRecognizer.delegate = weak;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    NSLog(@"=== nnn preferredStatusBarStyle");
    return _statusBarStyle;
}

@end
