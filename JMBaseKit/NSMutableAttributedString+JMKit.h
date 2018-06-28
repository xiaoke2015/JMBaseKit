//
//  NSMutableAttributedString+JMKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (JMKit)

// 设置富文本 文字颜色
- (void)jm_setTextColor:(UIColor*)color ;
// 设置富文本 背景颜色
- (void)jm_setBackgroundColor:(UIColor*)color ;
// 设置富文本字体
- (void)jm_setFont:(UIFont*)font ;
// 设置行间距
- (void)jm_setlineSpacing:(CGFloat)lineSpacing;


// 设置富文本 文字颜色
- (void)jm_setForegroundColor:(UIColor*)color range:(NSRange)range ;

// 设置富文本 背景颜色
- (void)jm_setBackgroundColor:(UIColor*)color range:(NSRange)range ;

// 设置富文本字体
- (void)jm_setFont:(UIFont*)font range:(NSRange)range ;

// 添加字符串
- (void)jm_appendString:(NSAttributedString*)attrString ;

@end
