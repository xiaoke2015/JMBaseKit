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

#import "UITextView+JMBaseKit.h"
#import "JMMenuView.h"

@interface OneViewController ()

@property (nonatomic ,strong)UIImageView * imgView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


//    self.navigationBar.backIndicatorImage = [UIImage imageWithColor:[UIColor yellowColor] size:CGSizeMake(40, 40)];
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.navigationItem.title = @"one";
//    self.backItemImage = [UIImage imageNamed:@"back"];


    self.view.backgroundColor = [UIColor whiteColor];

    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, SCREEM_WIDTH - 40, 120)];

    [self.view addSubview:textView];
    textView.backgroundColor = GRAY(240);
    textView.font = FONT(15);

    textView.jm_placeHolder = @"请填写您的意见反馈...";
    textView.jm_placeHolderColor = GRAY(200);

//
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    label.backgroundColor = [UIColor redColor];
//    label.text = @"请填写您的意见反馈";
//    [textView setValue:label forKey:@"_placeholderLabel"];
//
//    [textView insertSubview:label atIndex:0];


    JMMenuView * menuView = [[JMMenuView alloc]initWithFrame:CGRectMake(0, 200, 414, 80)];
    [self.view addSubview:menuView];

    menuView.titles = @[@"意见反馈",@"意见反馈",@"意见反馈",@"意见反馈"];
    menuView.images = @[IMAGE(@"home_001"),IMAGE(@"home_001"),
                        IMAGE(@"home_001"),IMAGE(@"home_001")];

    menuView.textFont = FONT(15);
    menuView.textColor = GRAY(51);

    menuView.didSelBlock = ^(NSInteger index) {

    };

    [menuView drawMenu];

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

//    self.navigationBar.backgroundColor = [UIColor clearColor];
//    self.navigationBar.shadowColor = [UIColor clearColor];
//    self.navigationBar.tintColor = GRAY(51);
//    self.navigationBar.textColor = [UIColor redColor];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


//
//    TwoViewController * nextVC = [[TwoViewController alloc]init];
//    nextVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:nextVC animated:YES];

}



@end
