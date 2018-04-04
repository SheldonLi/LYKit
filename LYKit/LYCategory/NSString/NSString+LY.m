//
//  NSString+LY.m
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import "NSString+LY.h"

@implementation NSString (LY)

+ (NSString *)ly_middelFourStarNumber:(NSString *)number {
    //星号字符串
    NSString *xinghaoStr = @"";
    //动态计算星号的个数
    for (int i = 0; i < number.length - 7; i++) {
        xinghaoStr = [xinghaoStr stringByAppendingString:@"*"];
    }
    //前3后四中间以星号拼接
    number = [NSString stringWithFormat:@"%@%@%@", [number substringToIndex:3], xinghaoStr,
                                        [number substringFromIndex:number.length - 4]];
    return number;
}

+ (NSString *)ly_removeWhitesetAndEnter:(NSString *)string {
    if (!string || [string isEqualToString:@""] || [string isEqualToString:@"<null>"]) {
        return string;
    }

    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string =
        [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return string;
}

+ (CGSize)ly_sizeForString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [string boundingRectWithSize:maxSize
                                options:NSStringDrawingUsesLineFragmentOrigin
                             attributes:attrs
                                context:nil]
        .size;
}

@end
