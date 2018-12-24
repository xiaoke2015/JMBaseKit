//
//  JMBaseConst.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/12/24.
//  Copyright © 2018 李加建. All rights reserved.
//

#ifndef JMBaseConst_h
#define JMBaseConst_h


#pragma mark - 常量宏 0.0.4 版本推荐使用 JMApp
// 尺寸大小
#define SCREEM    [UIScreen mainScreen].bounds

#define SCREEM_WIDTH  SCREEM.size.width

#define SCREEM_HEIGHT  SCREEM.size.height

#define KIsiPhoneX (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) || \
CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) || \
CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) || \
CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)))

#define KTabBar (KIsiPhoneX?84:50)

#define KNavBar (KIsiPhoneX?88:64)

#define KBody (SCREEM_HEIGHT - KTabBar - KNavBar)


// 颜色
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1]
#define RGBA(A,B,C,Alpha) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:Alpha]
#define GRAY(x) [UIColor colorWithRed:x/255.f green:x/255.f blue:x/255.f alpha:1]

// 文字大小
#define FONT(x) [UIFont systemFontOfSize:x]

#define POSTNotification(x)  [[NSNotificationCenter defaultCenter] postNotificationName:x object:nil];

#define alertShow(aMessage) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:aMessage preferredStyle:UIAlertControllerStyleAlert];\
[alertController addAction:[UIAlertAction actionWithTitle:@"OK"style:UIAlertActionStyleDefault handler:nil]];\
[self presentViewController:alertController animated:YES completion:nil];





#endif /* JMBaseConst_h */
