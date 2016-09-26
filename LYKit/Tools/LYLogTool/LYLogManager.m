//
//  LYLogManager.m
//  yeoner
//
//  Created by SheldonLee on 16/7/10.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import "LYLogManager.h"

@implementation LYLogManager

+ (instancetype)shareManager {
    static LYLogManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}


- (void)saveLogToDocument {
    
    
//  DEBUG模式有效
#ifdef DEBUG
    
    //   想从iTunes拿到log文件，需要手动改plist文件才有效
    NSMutableDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    [infoDict setValue:@(YES) forKey:@"UIFileSharingEnabled"];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *createPath = [NSString stringWithFormat:@"%@/log", pathDocuments];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *fileName = [createPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.log", [self currentTimeString]]];
    
    // 将log输入到文件
    freopen([fileName cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([fileName cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
#endif
}

- (NSString *)currentTimeString {
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    return locationString;
}

@end
