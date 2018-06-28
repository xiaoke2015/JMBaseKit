//
//  NSString+JMKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "NSString+JMKit.h"

@implementation NSString (JMKit)


- (NSMutableAttributedString*)jm_string {
    
    NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc]initWithString:self];
    return attrString;
}

@end
