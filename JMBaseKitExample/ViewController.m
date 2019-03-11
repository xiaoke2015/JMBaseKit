//
//  ViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import "ViewController.h"

#import "JMBaseKit.h"

#import "JMProgressHUD.h"

#import "UIImage+JMBaseKit.h"

#import "UIViewController+JMBaseKit.h"

#import "OneViewController.h"


@interface ViewController ()

//@property (nonatomic ,copy)JMActionBlock goAction;

@property (nonatomic ,strong)UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
       

//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor redColor];
//    view.center = CGPointMake(self.view.center.x, self.view.center.y - 80);
//    [self.view addSubview:view];
//    [self loadData];

    self.navigationItem.title = @"hello";
    self.view.backgroundColor = [UIColor grayColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];


    self.navigationBar.tintColor = GRAY(51);
    self.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationBar.shadowColor = [UIColor clearColor];
    self.navigationBar.translucent = NO;


}





- (void)loadData {



    [self automaticallyAdjustsScrollView:self.tableView];

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


    OneViewController * nextVC = [[OneViewController alloc]init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextVC animated:YES];



}





@end
