//
//  UIColor+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JMBaseKit)


+ (UIColor *)colorWithRGB:(uint32_t)rgbValue ;
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha ;

@end

NS_ASSUME_NONNULL_END
