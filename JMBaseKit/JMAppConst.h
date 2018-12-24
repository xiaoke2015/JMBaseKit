//
//  JMAppConst.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/12/24.
//  Copyright © 2018 李加建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define JMApp ([JMAppConst manager])
#define JMDef  ([NSUserDefaults standardUserDefaults])
#define JMNoti  ([NSNotificationCenter defaultCenter])

@interface JMAppConst : NSObject

#pragma mark - app  宽高属性
// 屏幕尺寸 按375 缩放比例
@property(nonatomic,readonly) CGFloat scale;
// 屏幕尺寸
@property(nonatomic,readonly) CGSize  size;
// 屏幕宽度
@property(nonatomic,readonly) CGFloat width;
// 屏幕高度
@property(nonatomic,readonly) CGFloat height;
// 判断是否为iphone X 类机型
@property(nonatomic,readonly) BOOL iPhoneX;
// tabBar 高度
@property(nonatomic,readonly) CGFloat tabBar;
// Navigationbar 高度
@property(nonatomic,readonly) CGFloat navBar;
// 去除 tabBar Navigationbar 的高度
@property(nonatomic,readonly) CGFloat body;


#pragma mark - app  app 常量 名称
/* app 名称 icon 版本 build*/
@property(nonatomic,readonly) NSString *name;
@property(nonatomic,readonly) NSString *icon;
@property(nonatomic,readonly) NSString *version;
@property(nonatomic,readonly) NSString *build;

+ (JMAppConst *)manager ;

// ios 10 震动反馈
+ (void)impactFeedback ;

@end



#pragma mark - 内联函数

static inline UIColor * JMRGB(CGFloat r ,CGFloat g ,CGFloat b) {

    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}

static inline UIColor * JMRGBA(CGFloat r ,CGFloat g ,CGFloat b ,CGFloat a) {

    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}

static inline UIColor * JMGRAY(CGFloat x) {

    CGFloat r = x/255.0;
    CGFloat g = x/255.0;
    CGFloat b = x/255.0;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

/* hex 颜色.  hex 为16进制数 e.g. 0x000000 */

static inline UIColor * JMHEXA(NSInteger hex ,CGFloat alpha) {

    CGFloat r = ((float)((hex & 0xFF0000) >> 16)) /255.0;
    CGFloat g = ((float)((hex & 0x00FF00) >> 8)) /255.0;
    CGFloat b = ((float)(hex & 0x0000FF)) /255.0;

    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];

}

static inline UIColor * JMHEX(NSInteger hex) {

    CGFloat r = ((float)((hex & 0xFF0000) >> 16)) /255.0;
    CGFloat g = ((float)((hex & 0x00FF00) >> 8)) /255.0;
    CGFloat b = ((float)(hex & 0x0000FF)) /255.0;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


/* 文字设置. */
#pragma mark - 文字设置

static inline UIFont * JMFont(CGFloat size) {

    return [UIFont systemFontOfSize:size];
}

static inline UIFont * JMFontN(CGFloat size , NSString * name) {

    return [UIFont fontWithName:name size:size];
}

