//
//  NSString+LYDateTool.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (LYDateTool)

/**
 *  获取当前时间
 */
+ (NSString *)ly_currentDate;

/**
 *  获取当前时间戳
 */
+ (NSString *)ly_getCurrentTimestamp;

/**
 *  与当前时间比较
 */
+ (NSString *)ly_compareCurrentTime:(NSString *)compareDate;

/**
 *  根据时间戳返回需要的日期
 */
+ (NSString *)ly_getDateStringFromLongString:(NSString *)longDateString;

/**
 *	根据返回时间戳处理
 */
+ (NSString *)ly_prettyTimeToNow:(NSString *)compareTime;


/**
 *  根据生日年月日计算星座
 */
+ (NSString *)ly_getConstellationStrFromDate:(NSString *)birthday;

/**
 *  根据生日计算年龄
 */
+ (NSString *)ly_getAgeStrFromBirthday:(NSString *)birthday;


@end
