//
//  JMBaseViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import "JMBaseViewController.h"

@interface JMBaseViewController ()

@end

@implementation JMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma detail 设置偏移量
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    
    [self reset];
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




- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
}



- (void)reset {
    
    _itemMargin = - 16;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}



- (void)setCustomView:(UIView *)customView {
    
    _customView = customView;
    
    self.navigationItem.titleView = _customView;
}

- (void)setRightItemBtn:(UIButton *)rightItemBtn {
    
    _rightItemBtn = rightItemBtn;
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightItemBtn];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barButtonItem.width = _itemMargin;
    
    self.navigationItem.rightBarButtonItems = @[barButtonItem, buttonItem];
}

- (void)setLeftItemBtn:(UIButton *)leftItemBtn {
    
    _leftItemBtn = leftItemBtn;
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftItemBtn];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barButtonItem.width = _itemMargin;
    
    self.navigationItem.leftBarButtonItems = @[barButtonItem, buttonItem];
}



- (void)initNaviBarBtn:(NSString*)title  {
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 30)];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    label.textColor = [UIColor whiteColor];
    
    self.customView = label;
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    UIImage * image = [UIImage imageNamed:@"btn_back"];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(naviBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftItemBtn = btn;
}


- (void)naviBtn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
