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

#import "JMImagePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JMString * jm_title = [@"我同意" jm_string];
    JMString * jm_detail = [@"《XXX注册协议》" jm_string];
    [jm_detail jm_setTextColor:[UIColor redColor]];
    
    [jm_title jm_appendString:jm_detail];
 
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    lable.attributedText = jm_title;
    
    [self.view addSubview:lable];
    
    self.title = @"标题";


 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self jm_setShadowColor:[UIColor purpleColor]];
    [self jm_setBarTintColor:[UIColor yellowColor]];
    [self jm_setTitleColor:[UIColor redColor]];
    
}



- (JMString*)stringwithtitle:(NSString*)title detail:(NSString*)detail {
    
    JMString * jm_title = [title jm_string];
    
    JMString * jm_detail = [detail jm_string];
    
    [jm_title jm_appendString:jm_detail];
    
    return jm_title;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    YYViewController * nextVC = [[YYViewController alloc]init];
//    [self.navigationController pushViewController:nextVC animated:YES];
    
    JMImagePicker * imgPicker = [JMImagePicker shareInstance];
    
    [imgPicker presentPicker:JMPickerType_Photo target:self callBackBlock:^(NSDictionary *infoDict, BOOL isCancel) {
        
        UIImage *img = [JMImagePicker imageWithInfo:infoDict];
        NSLog(@"%@",img);
    }];
}

@end
