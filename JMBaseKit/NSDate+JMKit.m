//
//  NSDate+JMKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "NSDate+JMKit.h"

@implementation NSDate (JMKit)


// get weak  周日 1 周一 2 。。。。 周六 7
- (NSInteger)acquireWeekDay {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitWeekday;
    NSDateComponents* comps = [calendar components:unitFlags fromDate:self];
    return [comps weekday];
}

- (NSInteger)day {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay fromDate:self];
    return [components day];
}

- (NSInteger)month {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

- (NSInteger)year {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear fromDate:self];
    return [components year];
}


// 当前日期后第几天
- (NSDate *)nextDateWithDay:(NSInteger)day  {
    
    NSDate * date = [NSDate dateWithTimeInterval:day * 86400 sinceDate:self];
    
    return date;
}



// 获取一周的第一天
- (NSDate *)weakFirstDay  {
    
    NSInteger day = [self acquireWeekDay];
    
    return [self nextDateWithDay:-day];
}


// 获取一周的最后一天
- (NSDate *)weakLastDay  {
    
    NSInteger day = [self acquireWeekDay];
    
    return [self nextDateWithDay:7-day];
}


- (NSString*)stringWithFormat:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:format];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:self];
    
    return currentDateString;
}





@end
