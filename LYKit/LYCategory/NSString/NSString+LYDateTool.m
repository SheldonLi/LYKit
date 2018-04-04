//
//  NSString+DateTool.m
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import "NSString+LYDateTool.h"

@implementation NSString (LYDateTool)

+ (NSString *)ly_currentDate {
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    return locationString;
}

+ (NSString *)ly_getCurrentTimestamp {
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return timeString;
}

+ (NSString *)ly_compareCurrentTime:(NSString *)compareDate {
    NSDateFormatter * dateformatter=[[NSDateFormatter alloc] init];
    NSString *newDate = [NSString ly_getDateStringFromLongString:compareDate];
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSDate * date = [dateformatter dateFromString:newDate];
    //    NSString * yesterday = [dateformatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]];
    
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    } else if ((temp = timeInterval/60) < 60) {
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    } else if ((temp = temp/60) < 24) {
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    } else {
        NSDate *dat = [dateformatter dateFromString:compareDate];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"YYYY-MM-dd HH:mm"];
        result = [format stringFromDate:dat];
    }
    //    else if([[compareDate substringWithRange:NSMakeRange(8, 2)] isEqualToString:[yesterday substringWithRange:NSMakeRange(8, 2)]]){
    //        result = [NSString stringWithFormat:@"昨天 %@",[compareDate substringWithRange:NSMakeRange(11, 5)]];
    //    }
    return result;
}



+ (NSString *)ly_getAgeStrFromBirthday:(NSString *)birthday {
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *locationDateString = [formatter stringFromDate:todayDate];
    NSArray *Tarray = [locationDateString componentsSeparatedByString:@"-"];
    NSString *TyearStr = [Tarray objectAtIndex:0];
    NSString *Tmonth = [Tarray objectAtIndex:1];
    NSString *Tday = [Tarray objectAtIndex:2];
    if([birthday isEqualToString:@"0"]) {
        return @"0";
    } else {
        NSString *dateString = birthday;
        NSString *str = dateString;
        NSTimeInterval time = [str doubleValue]/1000;
        NSDate *detaildate= [NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
        NSArray *birthday = [currentDateStr componentsSeparatedByString:@"-"];
        NSString *year = [birthday objectAtIndex:0];
        NSString *month = [birthday objectAtIndex:1];
        NSString *day = [birthday objectAtIndex:2];
        if([TyearStr intValue] > [year intValue] && [Tmonth intValue]*30 + [Tday intValue] >= [month intValue]*30 + [day intValue]) {
            
            return [NSString stringWithFormat:@"%d", [TyearStr intValue] - [year intValue]];
        } else {
            int ageStr = [TyearStr intValue] - [year intValue] - 1;
            
            if(ageStr < 0) {
                ageStr = 0;
            }
            return [NSString stringWithFormat:@"%d", ageStr];
        }
    }
}


+ (NSString *)ly_getConstellationStrFromDate:(NSString *)birthday {
    if (birthday == nil) {
        return @"暂未选择";
    }
    NSString *str = birthday;
    NSString *birthDayString = [NSString stringWithFormat:@"%.0f", [str doubleValue]/1000];
    NSArray *today = [[self ly_getDateStringFromLongString:birthDayString] componentsSeparatedByString:@"-"];
    NSString *month = [today objectAtIndex:1];
    NSString *day = [today objectAtIndex:2];
    NSString *monDay = [NSString stringWithFormat:@"%@%@", month, day];
    int monthDay = [monDay intValue];
    if (monthDay >= 321 && monthDay <= 419) {
        return @"白羊座";
    } else if (monthDay >= 420 && monthDay <= 520) {
        return @"金牛座";
    } else if (monthDay >= 521 && monthDay <=621) {
        return @"双子座";
    } else if (monthDay >= 622 && monthDay <= 722) {
        return @"巨蟹座";
    } else if (monthDay >= 723 && monthDay <= 822) {
        return @"狮子座";
    } else if (monthDay >= 823 && monthDay <= 922) {
        return @"处女座";
    } else if (monthDay >= 923 && monthDay <= 1023) {
        return @"天秤座";
    } else if (monthDay >= 1024 && monthDay <= 1122) {
        return @"天蝎座";
    } else if (monthDay >= 1123 && monthDay <= 1221) {
        return @"射手座";
    } else if ((monthDay >= 1222 && monthDay <= 1230) || (monthDay >=101 && monthDay <= 119)) {
        return @"摩羯座";
    } else if (monthDay >= 120 && monthDay <= 218) {
        return @"水瓶座";
    } else {
        return @"双鱼座";
    }
}

+ (NSString *)ly_prettyTimeToNow:(NSString *)compareTime {
    NSString *newDate = [NSString ly_setDateFromLongString:compareTime];
    NSString *lookDate = [NSString ly_setLookDateFromLongString:compareTime];
    NSString *date = [NSString ly_currentDate];
    NSArray *compareTimearray = [newDate componentsSeparatedByString:@"-"];
    NSArray *nowArray = [date componentsSeparatedByString:@"-"];
    int nowYear = [nowArray[0] intValue];
    int comYear = [compareTimearray [0] intValue];
    int nowMonth = [nowArray[1] intValue];
    int comMonth = [compareTimearray[1] intValue];
    int nowDay = [nowArray[2] intValue];
    int comDay = [compareTimearray[2] intValue];
    int nowHour = [nowArray[3] intValue];
    int comHour = [compareTimearray[3] intValue];
    int nowMin = [nowArray[4] intValue];
    int comMin = [compareTimearray[4] intValue];
    if(nowYear == comYear && nowMonth == comMonth && nowDay == comDay &&nowHour == comHour &&nowMin == comMin) {
        return @"刚刚";
    } else if(nowYear == comYear && nowMonth == comMonth && nowDay == comDay &&nowHour == comHour) {
        return [NSString stringWithFormat:@"%d分钟前",nowMin - comMin];
    } else if (nowYear == comYear && nowMonth == comMonth && nowDay == comDay) {
        return [NSString stringWithFormat:@"%d小时前",nowHour - comHour];
    } else {
        return lookDate;
    }
}

+ (NSString *)ly_getDateStringFromLongString:(NSString *)longDateString {
    if(longDateString.length >= 10) {
        NSString *dateString = [longDateString substringToIndex:10];
        NSString *str = dateString;
        NSTimeInterval time = [str doubleValue];
        NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
        return currentDateStr;
    } else {
        NSString *dateString = longDateString;
        NSString *str = dateString;
        NSTimeInterval time = [str doubleValue];
        NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
        return currentDateStr;
    }
}

+ (NSString *)ly_setDateFromLongString:(NSString *)longString {
    NSString *dateString = [longString substringToIndex:10];
    NSString *str = dateString;
    NSTimeInterval time = [str doubleValue];
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

+ (NSString *)ly_setLookDateFromLongString:(NSString *)longString {
    NSString *dateString = [longString substringToIndex:10];
    NSString *str = dateString;
    NSTimeInterval time = [str doubleValue];
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

@end
