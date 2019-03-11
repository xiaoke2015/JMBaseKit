//
//  JMApplication.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/25.
//  Copyright © 2019 李加建. All rights reserved.
//


/*

 单列系统信息
 app 不常用信息

 */

#import <Foundation/Foundation.h>

#import "MacroDefinition.h"

NS_ASSUME_NONNULL_BEGIN

@class JMApplication;

#define JM ([JMApplication instance])

@interface JMApplication : NSObject

// 屏幕尺寸
@property(nonatomic,readonly) CGRect bounds; 
// 缩放比例 按375
@property (nonatomic,readonly) CGFloat scale;
// 屏幕尺寸
@property (nonatomic,readonly) CGSize  size;
// 屏幕宽度
@property (nonatomic,readonly) CGFloat width;
// 屏幕高度
@property (nonatomic,readonly) CGFloat height;
// 判断是否为iphone X 类机型
@property (nonatomic,readonly) BOOL iPhoneX;
// tabBar 高度
@property (nonatomic,readonly) CGFloat tabBar;
// Navigationbar 高度
@property (nonatomic,readonly) CGFloat navBar;
// 去除 tabBar Navigationbar 的高度
@property (nonatomic,readonly) CGFloat body;
// 安全区域边距 
@property (nonatomic,readonly) UIEdgeInsets safeAreaInsets;


+ (JMApplication *)instance;


@end




@interface JMApplication (UIKit)


- (UIImage *)icon ;
- (NSString *)name ;
- (NSString *)version ;
- (NSString *)build ;
- (NSString *)bundleId ;

- (NSString *)systemVersion ;
- (NSString *)currentLanguage ;
- (BOOL)isZH_Han ;


- (void)openURL:(NSString *)url ;
- (void)impactFeedback ;

#pragma mark 系统信息

- (NSString*)phoneType ; //e.g. @"iPhone 8", @"iPhone X"


@end


NS_ASSUME_NONNULL_END
