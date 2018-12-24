//
//  JMAlertView.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/8/30.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMAlertView : UIAlertController

@property (nonatomic ,assign)UIAlertControllerStyle alertStyle;


- (void)addActionTitle:(NSString *)title
                 style:(UIAlertActionStyle)style
               handler:(void (^)(UIAlertAction *action))handler;

@end
