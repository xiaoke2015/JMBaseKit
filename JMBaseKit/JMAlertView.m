//
//  JMAlertView.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/8/30.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "JMAlertView.h"

@interface JMAlertView ()

@end

@implementation JMAlertView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (void)setAlertStyle:(UIAlertControllerStyle)alertStyle {
    _alertStyle = alertStyle;
    [self setValue:@(alertStyle) forKey:NSStringFromSelector(@selector(preferredStyle))];
}


- (void)addActionTitle:(NSString *)title
                 style:(UIAlertActionStyle)style
               handler:(void (^)(UIAlertAction *action))handler {
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:title
                                                     style:style
                                                   handler:handler];
    
    [self addAction:action];
}


@end
