//
//  NSString+SandBox.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/22.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "NSString+SandBox.h"

@implementation NSString (SandBox)

+ (NSString *)ly_documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
            lastObject];
}

+ (NSString *)ly_cachePath {
    return
        [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)ly_tempPath {
    return NSTemporaryDirectory();
}

- (NSString *)ly_appendDocumentPath {
    return [[NSString ly_documentPath] stringByAppendingPathComponent:self];
}

- (NSString *)ly_appendCachePath {
    return [[NSString ly_cachePath] stringByAppendingPathComponent:self];
}

- (NSString *)ly_appendTempPath {
    return [[NSString ly_tempPath] stringByAppendingPathComponent:self];
}

@end
