//
//  JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#ifndef JMBaseKit_h
#define JMBaseKit_h


// 尺寸大小
#define SCREEM    [UIScreen mainScreen].bounds

#define SCREEM_WIDTH  SCREEM.size.width

#define SCREEM_HEIGHT  SCREEM.size.height

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


// 颜色
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1]
#define RGBA(A,B,C,Alpha) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:Alpha]
#define GRAY(x) [UIColor colorWithRed:x/255.f green:x/255.f blue:x/255.f alpha:1]

// 文字大小
#define FONT(x) [UIFont systemFontOfSize:x]

#import "UIView+JMBaseKit.h"
#import "JMBaseViewController.h"
#import "JMBaseNavigationController.h"


#endif /* JMBaseKit_h */
