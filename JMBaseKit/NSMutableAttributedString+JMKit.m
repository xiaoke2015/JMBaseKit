//
//  NSMutableAttributedString+JMKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "NSMutableAttributedString+JMKit.h"


@implementation NSMutableAttributedString (JMKit)



- (void)jm_setTextColor:(UIColor*)color {
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:color};
    [self setAttributes:attributes range:NSMakeRange(0, self.length)];
}

- (void)jm_setBackgroundColor:(UIColor*)color {
    
    NSDictionary *attributes = @{NSBackgroundColorAttributeName:color};
    [self setAttributes:attributes range:NSMakeRange(0, self.length)];
}


- (void)jm_setFont:(UIFont*)font {
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    [self setAttributes:attributes range:NSMakeRange(0, self.length)];
}

- (void)jm_setlineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6;// 字体的行间距
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle};
    [self setAttributes:attributes range:NSMakeRange(0, self.length)];
}


- (void)jm_setForegroundColor:(UIColor*)color range:(NSRange)range {
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:color};
    [self setAttributes:attributes range:range];
}

- (void)jm_setBackgroundColor:(UIColor*)color range:(NSRange)range {
    
    NSDictionary *attributes = @{NSBackgroundColorAttributeName:color};
    
    [self setAttributes:attributes range:range];
}


- (void)jm_setFont:(UIFont*)font range:(NSRange)range {

    NSDictionary *attributes = @{NSFontAttributeName:font};
    [self setAttributes:attributes range:range];
}


- (void)jm_appendString:(NSAttributedString*)attrString {
    
    [self appendAttributedString:attrString];
}


@end
