//
//  NSObject+LYArchive.m
//  FengurArchive
//
//  Created by SheldonLee on 15/12/6.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "NSObject+LYArchive.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

//  基本数据类型
static NSString *intergeType = @"q";          // long / int
static NSString *uIntergeType = @"Q";         // unsigned long / int
static NSString *shortType = @"s";            // short
static NSString *uShortType = @"S";           // unsigned short
static NSString *intType = @"i";              // int
static NSString *uIntType = @"I";             // unsigned int
static NSString *longType = @"l";             // long / long long
static NSString *uLongType = @"L";            // unsigned long / unsigned long long
static NSString *floatType = @"f";            // float
static NSString *doubleType = @"d";           // double
static NSString *boolType = @"B";             // bool
static NSString *boolTyprFor32b = @"c";       // 32位机器下的bool

//  OC类型
static NSString *stringType = @"NSString";
static NSString *arrayType = @"NSArray";
static NSString *dictionaryType = @"NSDictionary";
static NSString *dataType = @"NSData";

//  扩展类 -> NSData
static NSString *imageType = @"UIImage";      // UIImage 类型


@implementation NSObject (LYArchive)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;    // 属性个数
    Ivar *ivarList = class_copyIvarList([self class], &count);

    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        // 获得成员属性名，除去下划线，从第一个角标开始截取
        NSString *keyName =
            [[NSString stringWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        id value = [self valueForKey:keyName];
        
        NSLog(@"ivarType:%@-----%@", ivarType, value);
        
        if ([value isKindOfClass:[NSObject class]] && ![value isKindOfClass:[NSNumber class]]) {
            // 截取前： @"NSString"
            // 截取后： NSString
            NSUInteger length = ivarType.length;
            ivarType = [ivarType substringWithRange:NSMakeRange(2, length - 3)];
        }
        if ([ivarType isEqualToString:longType] || [ivarType isEqualToString:uLongType] ||
            [ivarType isEqualToString:intergeType] || [ivarType isEqualToString:uIntergeType]) {
            [aCoder encodeInteger:[value longValue] forKey:keyName];
        } else if ([ivarType isEqualToString:intType] || [ivarType isEqualToString:uIntType]) {
            [aCoder encodeInt:[value intValue] forKey:keyName];
        } else if ([ivarType isEqualToString:shortType] || [ivarType isEqualToString:uShortType]) {
            [aCoder encodeInt32:[value intValue] forKey:keyName];
        } else if ([ivarType isEqualToString:doubleType]) {
            [aCoder encodeDouble:[value doubleValue] forKey:keyName];
        } else if ([ivarType isEqualToString:boolType] ||
                   [ivarType isEqualToString:boolTyprFor32b]) {
            [aCoder encodeBool:[value boolValue] forKey:keyName];
        } else if ([ivarType isEqualToString:floatType]) {
            [aCoder encodeFloat:[value floatValue] forKey:keyName];
        } else if ([ivarType isEqualToString:stringType]) {    // string 类型
            [aCoder encodeObject:value forKey:keyName];
        } else if ([ivarType isEqualToString:arrayType]) {    // array 类型
            [aCoder encodeObject:value forKey:keyName];
        }  else if ([ivarType isEqualToString:dictionaryType]) {    // dicrionary 类型
            [aCoder encodeObject:value forKey:keyName];
        }  else if ([ivarType isEqualToString:dataType]) {    // data 类型
            [aCoder encodeObject:value forKey:keyName];
        } else if ([ivarType isEqualToString:imageType]) {
            [aCoder encodeDataObject:UIImagePNGRepresentation(value)];
        }
    }
    free(ivarList);
}

// 反归档，是一个解码的过程。
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];

    if (self) {
        unsigned int count = 0;    // 属性个数
        Ivar *varArray = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar var = varArray[i];
            NSString *keyName =
                [[NSString stringWithUTF8String:ivar_getName(var)] substringFromIndex:1];
            NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];

            NSArray *array = [ivarType componentsSeparatedByString:@"@"];
            if (array.count >= 2) {
                // 截取前： @"NSString"
                // 截取后： NSString
                NSUInteger length = ivarType.length;
                ivarType = [ivarType substringWithRange:NSMakeRange(2, length - 3)];
            }

            if ([ivarType isEqualToString:longType] || [ivarType isEqualToString:uLongType] ||
                [ivarType isEqualToString:intergeType] || [ivarType isEqualToString:uIntergeType]) {
                NSInteger number = [aDecoder decodeIntegerForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:shortType] ||
                       [ivarType isEqualToString:uShortType]) {
                short number = [aDecoder decodeIntForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:intType]) {
                int number = [aDecoder decodeIntForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:uIntType]) {
                unsigned int number = [aDecoder decodeIntForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:uLongType]) {
                NSUInteger number = [aDecoder decodeIntegerForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:floatType]) {
                float number = [aDecoder decodeFloatForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:doubleType]) {
                double number = [aDecoder decodeDoubleForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:boolType] ||
                       [ivarType isEqualToString:boolTyprFor32b]) {
                BOOL number = [aDecoder decodeBoolForKey:keyName];
                [self setValue:@(number) forKey:keyName];
            } else if ([ivarType isEqualToString:imageType]) {    // image 类型
                UIImage *image = [UIImage imageWithData:[aDecoder decodeDataObject]];
                [self setValue:image forKey:keyName];
            } else if ([ivarType isEqualToString:stringType] || [ivarType isEqualToString:dictionaryType] || [ivarType isEqualToString:arrayType] || [ivarType isEqualToString:dataType]) {    // string 类型
                NSString *string = [aDecoder decodeObjectForKey:keyName];
                [self setValue:string forKey:keyName];
            }
        }
    }
    return self;
}

@end
