//
//  NSString+SandBox.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/22.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SandBox)

/** 获取文档目录 */
+ (NSString *)ly_documentPath;
/** 获取缓存目录 */
+ (NSString *)ly_cachePath;
/** 获取临时目录 */
+ (NSString *)ly_tempPath;

/**
 *  添加文档路径
 */
- (NSString *)ly_appendDocumentPath;
/**
 *  添加缓存路径
 */
- (NSString *)ly_appendCachePath;
/**
 *  添加临时路径
 */
- (NSString *)ly_appendTempPath;

@end
