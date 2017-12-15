//
//  NSDate+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2017/12/15.
//  Copyright © 2017年 李加建. All rights reserved.
//

#import "NSDate+JMBaseKit.h"

@implementation NSDate (JMBaseKit)



// NSDate  转String format时间格式 yyyy-MM-dd HH:mm:ss zzz
- (NSString *)stringWithFormat:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    NSString * string = [dateFormatter setDateFormat:format];
    
    return string;
}


@end
