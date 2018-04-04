//
//  NSString+Predicate.m
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import "NSString+Predicate.h"


#define PASSWORD_MIN 6
#define PASSWORD_MAX 20

@implementation NSString (Predicate)

+ (BOOL)ly_validateMobile:(NSString *)mobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
    // NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^1[\\d]{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL)ly_validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)ly_validatePassword:(NSString *)password {
    if ([password length] < PASSWORD_MIN || [password length] > PASSWORD_MAX) {
        return NO;
    }

    /*只能输数字+字母*/
    for (int i = 0; i < [password length]; i++) {
        int a = [password characterAtIndex:i];
        if (!((a > 47 && a < 58) || (a > 64 && a < 91) || (a > 96 && a < 123))) return NO;
    }
    return YES;
}

+ (BOOL)ly_validateIdentityCard:(NSString *)identityCard {
    if (identityCard.length != 18) {
        return NO;
    }
    NSArray *codeArray =
        [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7",
                                  @"9", @"10", @"5", @"8", @"4", @"2", nil];
    NSDictionary *checkCodeDic = [NSDictionary
        dictionaryWithObjects:[NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6",
                                                        @"5", @"4", @"3", @"2", nil]
                      forKeys:[NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6",
                                                        @"7", @"8", @"9", @"10", nil]];

    NSScanner *scan = [NSScanner scannerWithString:[identityCard substringToIndex:17]];

    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;

    for (int i = 0; i < 17; i++) {
        sumValue += [[identityCard substringWithRange:NSMakeRange(i, 1)] intValue] *
                    [[codeArray objectAtIndex:i] intValue];
    }
    NSString *strlast =
        [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d", sumValue % 11]];

    if ([strlast isEqualToString:[[identityCard
                                     substringWithRange:NSMakeRange(17, 1)] uppercaseString]]) {
        return YES;
    }
    return NO;
}

+ (BOOL)ly_isContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange,
                                         NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                // surrogate pair
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc =
                                            ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            isEomji = YES;
                                        }
                                    }
                                } else {
                                    // non surrogate
                                    if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                                        isEomji = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        isEomji = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        isEomji = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        isEomji = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d ||
                                               hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c ||
                                               hs == 0x2b1b || hs == 0x2b50 || hs == 0x231a) {
                                        isEomji = YES;
                                    }
                                    if (!isEomji && substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        if (ls == 0x20e3) {
                                            isEomji = YES;
                                        }
                                    }
                                }
                            }];
    return isEomji;
}


@end
