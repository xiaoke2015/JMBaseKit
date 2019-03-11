//
//  MacroDefinition.h
//  NaviTabTest
//
//  Created by 李加建 on 2019/2/25.
//  Copyright © 2019 mobile. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


/*
 尺寸
 */
#define SCREEM          ([UIScreen mainScreen].bounds)

#define SCREEM_WIDTH    ([UIScreen mainScreen].bounds.size.width)

#define SCREEM_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

#define KIsiPhoneX      (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||\
                         CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||\
                         CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||\
                         CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)))

#define KTabBar         (KIsiPhoneX ? 84:50)

#define KNavBar         (KIsiPhoneX ? 88:64)

#define KBody           (SCREEM_HEIGHT - KTabBar - KNavBar)


/*
 颜色
 */
#define RGBA(R,G,B,A)      [UIColor colorWithRed:(R)/255.f green:(G)/255.f blue:(B)/255.f alpha:A]

#define RGB(R,G,B)         [UIColor colorWithRed:(R)/255.f green:(G)/255.f blue:(B)/255.f alpha:1]

#define GRAY(x)            [UIColor colorWithRed:(x)/255.f green:(x)/255.f blue:(x)/255.f alpha:1]

#define RGBRandom          [UIColor colorWithRed:arc4random_uniform(256)/255.0 \
                                           green:arc4random_uniform(256)/255.0 \
                                            blue:arc4random_uniform(256)/255.0 alpha:1]

#define HEX(rgb)           [UIColor colorWithRed:(((float)((rgb & 0xFF0000) >> 16))/255.0)\
                                           green:(((float)((rgb & 0x00FF00) >> 8))/255.0) \
                                            blue:(((float)(rgb & 0x0000FF)) / 255.0) alpha:1]

#define HEXA(rgb ,A)       [UIColor colorWithRed:(((float)((rgb & 0xFF0000) >> 16))/255.0) \
                                           green:(((float)((rgb & 0x00FF00) >> 8))/255.0) \
                                            blue:(((float)(rgb & 0x0000FF)) / 255.0) alpha:A]




// 文字大小
#pragma mark - 文字大小
#define FONT(f)           [UIFont systemFontOfSize:f]
#define FONTA(f,n)        [UIFont fontWithName:n size:f]
// 图片创建
#pragma mark - 图片创建
#define IMAGE(x)          [UIImage imageNamed:x]



// 重写NSLog,Debug模式下打印日志和当前行数
// #if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s[%d]:%s\n", "", __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
//#endif


//=============================================================================
// @name 判断数据是否为空
//=============================================================================
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//=============================================================================





#define JMClassInitFromString(aString)  [[NSClassFromString(aString) alloc]init]



#endif /* MacroDefinition_h */
