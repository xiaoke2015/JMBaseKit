//
//  NSDate+JMKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/15.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <Foundation/Foundation.h>

// 年月日
static NSString * const JMDateFormatYMD = @"yyyy-MM-dd";

// 年月日 时分秒
static NSString * const JMDateFormatYMDHMS = @"yyyy-MM-dd HH:mm:ss";

// 年月日 时分秒
static NSString * const JMDateFormatDefault = @"yyyy-MM-dd HH:mm:ss zzz";


@interface NSDate (JMKit)

// get weak  周日 1 周一 2 。。。。 周六 7
- (NSInteger)acquireWeekDay;
- (NSInteger)day;
- (NSInteger)month;
- (NSInteger)year;

// 当前日期后第几天
- (NSDate *)nextDateWithDay:(NSInteger)day;
// 获取一周的第一天
- (NSDate *)weakFirstDay ;
// 获取一周的最后一天
- (NSDate *)weakLastDay ;

//或者格式化字符串
- (NSString*)stringWithFormat:(NSString*)format ;


@end
