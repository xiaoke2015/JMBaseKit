//
//  JMNavigationController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "JMNavigationController.h"

@interface JMNavigationController ()

<UINavigationControllerDelegate, UIGestureRecognizerDelegate>


@end

@implementation JMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.delegate = self;

    __weak typeof (self) weak = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        /**
         UIGestureRecognizerDelegate
         self.interactivePopGestureRecognizer.enabled = YES;

         */
        self.interactivePopGestureRecognizer.delegate = weak;
    }
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

    return [self.topViewController preferredStatusBarStyle];
}



@end
