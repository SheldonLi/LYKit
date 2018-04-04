//
//  NSString+QYFileSizeParsing.m
//  Oatos
//
//  Created by SheldonLee on 2017/3/17.
//  Copyright © 2017年 QYY. All rights reserved.
//

#import "NSString+QYFileSizeParsing.h"

@implementation NSString (QYFileSizeParsing)

+ (NSString *)qy_fileSize:(long long)bit {
    
    NSString *sizeString;
    static int KB = 1024;
    static int MB = 1048576;
    static uint64_t GB = 1073741824;
    static uint64_t TB = 1099511627776;
    
    if (bit <= 0) {
        return @"0B";
    }
    
    if (bit < KB) {
        sizeString = [NSString stringWithFormat:@"%lldB", bit];
    } else if (bit >= KB && bit < MB) {
        sizeString = [NSString stringWithFormat:@"%.2fKB", bit / (float)KB];
    } else if (bit >= MB && bit < GB) {
        sizeString = [NSString stringWithFormat:@"%.2fMB", bit / (float)MB];
    } else if (bit >= GB && bit < TB) {
        sizeString = [NSString stringWithFormat:@"%.2fGB", bit / (float)GB];
    } else if (bit >= TB) {
        sizeString = [NSString stringWithFormat:@"%.2fTB", bit / (float)TB];
    } else {
        sizeString = @"0B";
    }
    return sizeString;
}

+ (NSString *)qy_uploadFileSize:(long long)bit {
    
    NSString *sizeString;
    static int KB = 1024;
    static int MB = 1048576;
    static uint64_t GB = 1073741824;
    static uint64_t TB = 1099511627776;
    
    //  比例为0.9
    static int approachKB = 921;
    static int approachMB = 943718;
    static uint64_t approachGB = 966367641;
    static uint64_t approachTB = 989560464000;
    
    if (bit <= 0) {
        return @"0B";
    }
    
    if (bit < approachKB) {
        sizeString = [NSString stringWithFormat:@"%lldB", bit];
    } else if (bit >= approachKB && bit < approachMB) {
        sizeString = [NSString stringWithFormat:@"%.1fKB", bit / (float)KB];
    } else if (bit >= approachMB && bit < approachGB) {
        sizeString = [NSString stringWithFormat:@"%.1fMB", bit / (float)MB];
    } else if (bit >= approachGB && bit < approachTB) {
        sizeString = [NSString stringWithFormat:@"%.1fGB", bit / (float)GB];
    } else if (bit >= approachTB) {
        sizeString = [NSString stringWithFormat:@"%.1fTB", bit / (float)TB];
    } else {
        sizeString = @"0B";
    }
    return sizeString;
}

@end
