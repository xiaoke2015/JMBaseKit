//
//  ViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import "ViewController.h"

#import "YYViewController.h"

#import "JMBaseKit.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
       
    [self loadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
    
}





- (void)loadData {
    
    CGFloat width = JMApp.width;
    CGFloat tabBar = JMApp.tabBar;
    CGFloat navBar = JMApp.navBar;
    CGFloat iPhoneX = JMApp.iPhoneX;
    CGFloat body = JMApp.body;
    NSString * build = JMApp.build;
    NSString * version = JMApp.version;
    NSString * name = JMApp.name;
    NSString * icon = JMApp.icon;


    SCREEM_HEIGHT;
    SCREEM_WIDTH;
    KBody;
    KIsiPhoneX;


    [NSUserDefaults standardUserDefaults];
    [NSNotificationCenter defaultCenter];

    [JMDef objectForKey:@""];
    [JMNoti postNotificationName:@"" object:nil];


    CGRectMake(0, 0, 0, 0);
    RGB(0, 0, 0);
    JMRGB(0, 0, 0);
    JMFont(10);
    FONT(10);
}




@end
