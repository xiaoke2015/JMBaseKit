//
//  UINavigationBar+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "UINavigationBar+JMBaseKit.h"

#import <objc/runtime.h>

@implementation UINavigationBar (JMBaseKit)


- (void)setBackgroundImage:(UIImage *)backgroundImage {

    [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}


- (UIImage*)backgroundImage {

    return [self backgroundImageForBarMetrics:UIBarMetricsDefault];
}


#pragma mark 背景色
static char * backgroundColorkey = "backgroundColorkey";


- (void)setBackgroundColor:(UIColor *)backgroundColor {

    objc_setAssociatedObject(self, backgroundColorkey, backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.backgroundImage = [self naviWithColor:backgroundColor];
}

- (UIColor*)backgroundColor {

    return objc_getAssociatedObject(self, backgroundColorkey);
}

#pragma mark 底部线条色
static char * shadowColorkey = "shadowColorkey";

- (void)setShadowColor:(UIColor *)shadowColor {
    objc_setAssociatedObject(self, shadowColorkey, shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.shadowImage = [self naviWithColor:shadowColor];
}

- (UIColor*)shadowColor {
    return objc_getAssociatedObject(self, shadowColorkey);
}



// 处理颜色
- (UIImage *)naviWithColor:(UIColor *)color {

    CGSize size = CGSizeMake(0.5, 0.5);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

#pragma mark - 颜色
// navigation text 颜色，字体

static char * textColorkey = "textColorkey";

- (void)setTextColor:(UIColor *)textColor {
    objc_setAssociatedObject(self, textColorkey, textColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:self.titleTextAttributes];
    [attributes setValuesForKeysWithDictionary:@{NSForegroundColorAttributeName:textColor}];
    self.titleTextAttributes = attributes ;

}

- (UIColor*)textColor {
    return objc_getAssociatedObject(self, textColorkey);
}


#pragma mark - 字体
static char * fontkey = "fontkey";

- (void)setFont:(UIFont *)font {

    objc_setAssociatedObject(self, fontkey, font, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:self.titleTextAttributes];
    [attributes setValuesForKeysWithDictionary:@{NSFontAttributeName:font}];
    self.titleTextAttributes = attributes ;

}

- (UIFont*)font {
    return objc_getAssociatedObject(self, fontkey);
}



/*  //    */

- (void)clearColor {

    self.backgroundImage = [self naviWithColor:[UIColor clearColor]];
    self.shadowImage = [self naviWithColor:[UIColor clearColor]];
}


@end
