//
//  NSObject+LYArchive.h
//  FengurArchive
//
//  Created by SheldonLee on 15/12/6.
//  Copyright © 2015年 U-Works. All rights reserved.
//


//  TODO:  OC Mutable类的解析  模型类解析


//  自动化归档与解归档
//  用法:
//  1. 在自定义模型里：#import "NSObject+LYArchive.h"
//  2. 在.h定义好属性（支持NSString, NSArray, NSDictionary, NSData, UIImage, NSInteger/long/long long/int/float/double/BOOL(包括unsigned的)）
/**
 
 @property (nonatomic, copy) NSString *name;
 @property (nonatomic, strong) UIImage *image;
 @property (nonatomic, assign) NSUInteger ageNSUInteger;
 @property (nonatomic, assign) NSInteger ageNSInteger;
 @property (nonatomic, assign) long long ageLongLong;
 @property (nonatomic, assign) unsigned long long ageULongLong;
 @property (nonatomic, assign) unsigned long ageULong;
 @property (nonatomic, assign) unsigned int ageUInt;
 @property (nonatomic, assign) long ageLong;
 @property (nonatomic, assign) int ageInt;
 @property (nonatomic, assign) float ageFloat;
 @property (nonatomic, assign) double ageDouble;
 @property (nonatomic, assign) BOOL ageBOOL;
 
 - (BOOL)saveModel;
 
 + (instancetype)getModel;
 
 */

//  3. 在.m设置好归档路径以及实现NSCoding协议的方法即可

/**
//  归档路径
#define kPersonModelPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"person.data"]

- (BOOL)saveModel
{
    return [NSKeyedArchiver archiveRootObject:self toFile:kPersonModelPath];
}
 
+ (instancetype)getModel
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kPersonModelPath];
}

*/


#import <Foundation/Foundation.h>

@interface NSObject (LYArchive) <NSCoding>

@end
