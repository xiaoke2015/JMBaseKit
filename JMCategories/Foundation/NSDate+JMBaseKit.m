//
//  NSDate+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "NSDate+JMBaseKit.h"

@implementation NSDate (JMBaseKit)

// get weak  周日 1 周一 2 ... 周六 7
- (NSInteger)acquireWeekDay {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitWeekday;
    NSDateComponents* comps = [calendar components:unitFlags fromDate:self];
    return [comps weekday];
}

- (NSInteger)day {

    NSCalendarIdentifier cid = NSCalendarIdentifierGregorian;

    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:cid];

    NSDateComponents *components = [calender components:NSCalendarUnitDay fromDate:self];

    return [components day];
}

- (NSInteger)month {

    NSCalendarIdentifier cid = NSCalendarIdentifierGregorian;

    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:cid];

    NSDateComponents *components = [calender components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

- (NSInteger)year {

    NSCalendarIdentifier cid = NSCalendarIdentifierGregorian;

    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:cid];

    NSDateComponents *components = [calender components:NSCalendarUnitYear fromDate:self];
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
