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


#pragma mark - 常用字符串转换
/* 手机号码隐藏中间四位数 */
- (NSString *)phoneHideCenter ;

/* 固定字符串宽度 自适应高度 */
- (CGFloat)heightLayoutFont:(UIFont*)font width:(CGFloat)width ;

/* 固定字符串高度 自适应宽度 */
- (CGFloat)widthLayoutFont:(UIFont*)font height:(CGFloat)height ;

#pragma mark - 转换 NSAttributedString
/* 转换 NSAttributedString */
- (NSAttributedString*)attrWithcolor:(UIColor *)color
                                font:(UIFont *)font
                         lineSpacing:(CGFloat)lineSpacing
                 firstLineHeadIndent:(CGFloat)firstLineHeadIndent;


#pragma mark - 编码方式

/* Base64 编码 */
- (NSString *)encodeBase64String;
/* Base64 解码 */
- (NSString *)dencodeBase64String;
/* UTF-8 编码 */
- (NSString *)encodeUTF8String;
/* md5 加密  */
- (NSString *)encodemd5String;



#pragma mark - json 转换

/** json对象转字符串 */
+ (NSString*)dictionaryToJson:(id)dic ;
/** 字符串转数组或字典 */
- (id)JSONValue ;

@end
