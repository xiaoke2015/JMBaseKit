//
//  UIButton+JMKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/28.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JMButtonVerticalAlignment) {
    JMButtonVerticalAlignmentCenter  = 0,
    JMButtonVerticalAlignmentTop     = 1,
    JMButtonVerticalAlignmentBottom  = 2,
    JMButtonVerticalAlignmentFill    = 3,
};

typedef NS_ENUM(NSInteger, JMButtonHorizontalAlignment) {
    JMButtonHorizontalAlignmentCenter = 0,
    JMButtonHorizontalAlignmentLeft   = 1,
    JMButtonHorizontalAlignmentRight  = 2,
    JMButtonHorizontalAlignmentFill   = 3,
};

@interface UIButton (JMKit)

@end
