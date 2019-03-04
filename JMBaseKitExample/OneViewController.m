//
//  OneViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "OneViewController.h"

#import "JMBaseKit.h"

#import "TwoViewController.h"

#import "TwoViewController.h"

@interface OneViewController ()

@property (nonatomic ,strong)UIImageView * imgView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


//    self.navigationBar.backIndicatorImage = [UIImage imageWithColor:[UIColor yellowColor] size:CGSizeMake(40, 40)];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"one";
    self.backItemImage = [UIImage imageNamed:@"back"];


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    self.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationBar.shadowColor = [UIColor clearColor];
    self.navigationBar.tintColor = GRAY(51);
    self.navigationBar.textColor = [UIColor redColor];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {



    TwoViewController * nextVC = [[TwoViewController alloc]init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextVC animated:YES];

}



@end
