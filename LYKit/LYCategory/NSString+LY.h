//
//  NSString+LY.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LY)


/**
 *  前3后4中间以*拼接,返回处理好的字符串
 */
+ (NSString *)ly_middelFourStarNumber:(NSString *)number;

/**
 *  去除空格和换行符后的string
 */
+ (NSString *)ly_removeWhitesetAndEnter:(NSString *)string;

/**
 *  获取字符串size
 */
+ (CGSize)ly_sizeForString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
