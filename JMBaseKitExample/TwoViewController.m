//
//  TwoViewController.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/27.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "TwoViewController.h"

#import "JMBaseKit.h"

#import "MacroDefinition.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"two";
    self.backItemImage = [UIImage imageNamed:@"back"];


    


    [self.navigationController setNeedsStatusBarAppearanceUpdate];
    
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

    return UIStatusBarStyleLightContent;
}


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    self.navigationBar.backgroundColor = [UIColor redColor];
    self.navigationBar.shadowColor = [UIColor clearColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.textColor = [UIColor whiteColor];

    [self.navigationBar clearColor];

}



@end
