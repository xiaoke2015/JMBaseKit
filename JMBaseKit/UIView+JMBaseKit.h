//
//  UIView+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
                top
         |-------------------|
         |-------------------|
    left |-------------------| right
         |-------------------|
         |-------------------|
         |-------------------|
                bottom
 */



@interface UIView (JMBaseKit)

@property (nonatomic,assign)CGFloat top;
@property (nonatomic,assign)CGFloat bottom;
@property (nonatomic,assign)CGFloat left;
@property (nonatomic,assign)CGFloat right;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;

@end
