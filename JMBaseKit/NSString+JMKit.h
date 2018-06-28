//
//  NSString+JMKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <Foundation/Foundation.h>

//起别名
typedef NSMutableAttributedString JMString;

#import "NSMutableAttributedString+JMKit.h"

@interface NSString (JMKit)

// 转换可变字符串
- (NSMutableAttributedString*)jm_string ;

@end
