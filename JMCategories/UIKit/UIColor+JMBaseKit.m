//
//  UIColor+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "UIColor+JMBaseKit.h"

@implementation UIColor (JMBaseKit)



+ (UIColor *)colorWithRGB:(uint32_t)rgbValue {

    CGFloat r = ((rgbValue & 0xFF0000) >> 16) / 255.0f;
    CGFloat g = ((rgbValue & 0xFF00) >> 8) / 255.0f;
    CGFloat b = (rgbValue & 0xFF) / 255.0f ;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue {

    return [UIColor colorWithRed:((rgbaValue & 0xFF000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xFF0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xFF00) >> 8) / 255.0f
                           alpha:(rgbaValue & 0xFF) / 255.0f];
}

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {

    CGFloat r = ((rgbValue & 0xFF0000) >> 16) / 255.0f;
    CGFloat g = ((rgbValue & 0xFF00) >> 8) / 255.0f;
    CGFloat b = (rgbValue & 0xFF) / 255.0f;

    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

@end
