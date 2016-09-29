//
//  LYHealthKitTool.m
//  WTHealth
//
//  Created by SheldonLee on 16/1/21.
//  Copyright © 2016年 WT. All rights reserved.
//

#import "LYHealthKitTool.h"
#import <HealthKit/HealthKit.h>

@implementation LYHealthKitTool

+ (void)getStepForDays:(NSDate *)date
               success:(hk_successBlock)success
               failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType =
        [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];    //步数
    HKUnit *unit = [HKUnit countUnit];

    [self getQuantityType:quantityType
        ofDate:date
        daysLastCount:1
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getStepForLastDaysSuccess:(hk_successBlock)success failure:(hk_failureBlock)failure {
    [self getStepForDays:nil
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getStepForLastWeekSuccess:(hk_successBlock)success failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType =
        [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];    //步数
    HKUnit *unit = [HKUnit countUnit];

    [self getQuantityType:quantityType
        ofDate:nil
        daysLastCount:7
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getStepAllDaysSuccess:(hk_successBlock)success failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType =
        [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];    //步数
    HKUnit *unit = [HKUnit countUnit];

    [self getQuantityType:quantityType
        ofDate:nil
        daysLastCount:0
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getWalkingRunningForDays:(NSDate *)date
                         success:(hk_successBlock)success
                         failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType =
        [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];    //步数
    HKUnit *unit = [HKUnit countUnit];

    [self getQuantityType:quantityType
        ofDate:date
        daysLastCount:1
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getWalkingRunningForLastDaysSuccess:(hk_successBlock)success
                                    failure:(hk_failureBlock)failure {
    [self getWalkingRunningForDays:nil
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getWalkingRunningForLastWeekSuccess:(hk_successBlock)success
                                    failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType = [HKObjectType
        quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];    //跑步距离
    HKUnit *unit = [HKUnit meterUnit];
    [self getQuantityType:quantityType
        ofDate:nil
        daysLastCount:7
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getWalkingRunningAllDaysSuccess:(hk_successBlock)success failure:(hk_failureBlock)failure {
    HKQuantityType *quantityType = [HKObjectType
        quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];    //跑步距离
    HKUnit *unit = [HKUnit meterUnit];
    [self getQuantityType:quantityType
        ofDate:nil
        daysLastCount:0
        outputUnit:unit
        success:^(NSArray *resultsArray) {
            if (success) {
                success(resultsArray);
            }
        }
        failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)getQuantityType:(HKQuantityType *)type
                 ofDate:(NSDate *)date
          daysLastCount:(NSUInteger)days
             outputUnit:(HKUnit *)unit
                success:(hk_successBlock)success
                failure:(hk_failureBlock)failure {
    HKHealthStore *healthStore = [[HKHealthStore alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *interval = [[NSDateComponents alloc] init];
    interval.day = 1;
    //设置一个计算的时间点
    NSDateComponents *anchorComponents =
        [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
                             NSCalendarUnitWeekday
                    fromDate:[NSDate date]];

    NSInteger offset = (7 + anchorComponents.weekday - 2) % 7;
    anchorComponents.day -= offset;
    //设置从几点开始计时
    anchorComponents.hour = 0;
    NSDate *anchorDate = [calendar dateFromComponents:anchorComponents];

    //创建查询   intervalcomponents:按照多少时间间隔查询
    HKStatisticsCollectionQuery *query =
        [[HKStatisticsCollectionQuery alloc] initWithQuantityType:type
                                          quantitySamplePredicate:nil
                                                          options:HKStatisticsOptionCumulativeSum
                                                       anchorDate:anchorDate
                                               intervalComponents:interval];
    __block NSUInteger blockDay = days;
    //查询结果
    query.initialResultsHandler = ^(HKStatisticsCollectionQuery *query,
                                    HKStatisticsCollection *results, NSError *error) {
        if (error) {
            NSLog(@"error = %@", error.description);
            if (failure) {
                failure(error);
            }
        }

        NSLog(@"%@", results);
        NSDate *endDate = date ? date : [NSDate date];
        /*value 这个参数很重要  －7：表示从今天开始逐步查询后面七天的步数
         NSCalendarUnitDay  表示按照什么类型输出
         */
        if (days == 0) {
            blockDay = results.statistics.count;
        }
        NSDate *startDate =
            [calendar dateByAddingUnit:NSCalendarUnitDay value:-blockDay toDate:endDate options:0];

        NSMutableArray *resulteArray = [NSMutableArray array];
        NSMutableArray *dateArray = [NSMutableArray array];
        NSMutableArray *valueArray = [NSMutableArray array];

        [results enumerateStatisticsFromDate:startDate
                                      toDate:endDate
                                   withBlock:^(HKStatistics *_Nonnull result, BOOL *_Nonnull stop) {

                                       HKQuantity *quantity = result.sumQuantity;
                                       NSDate *date = result.startDate;

                                       NSDateFormatter *outputFormatter =
                                           [[NSDateFormatter alloc] init];
                                       //设置时区
                                       [outputFormatter setLocale:[NSLocale currentLocale]];
                                       [outputFormatter setDateFormat:@"yyyy-MM-dd"];
                                       NSString *dateStr = [outputFormatter stringFromDate:date];
                                       
                                       double value = [quantity doubleValueForUnit:unit];
                                       
                                       [resulteArray addObject:result];
                                       [dateArray addObject:result.startDate];
                                       [valueArray addObject:@(value)];
                                   }];

        if (success) {
            success(resulteArray);
        }

    };
    [healthStore executeQuery:query];
}


@end
