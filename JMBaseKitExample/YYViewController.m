//
//  YYViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/14.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "YYViewController.h"

#import "JMBaseKit.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self jm_setBackItemTitle:JMBackItemTitle];
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

@end
