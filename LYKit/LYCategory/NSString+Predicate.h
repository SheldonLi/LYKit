//
//  NSString+Predicate.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)

/**
 *  判断是否为手机号
 */
+ (BOOL)ly_validateMobile:(NSString *)mobile;

/**
 *  判断是否满足密码限制（数字+字母）
 */
+ (BOOL)ly_validatePassword:(NSString *)password;

/**
 *  判断是否为电子邮箱
 */
+ (BOOL)ly_validateEmail:(NSString *)email;

/**
 *  判断是否为二代身份证格式
 */
+ (BOOL)ly_validateIdentityCard:(NSString *)identityCard;

/**
 *  判断是否含有emoji表情
 */
+ (BOOL)ly_isContainsEmoji:(NSString *)string;

@end
