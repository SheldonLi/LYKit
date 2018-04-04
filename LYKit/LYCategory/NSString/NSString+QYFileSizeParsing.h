//
//  NSString+QYFileSizeParsing.h
//  Oatos
//
//  Created by SheldonLee on 2017/3/17.
//  Copyright © 2017年 QYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QYFileSizeParsing)

/**
 *  文件大小解析
 */
+ (NSString *)qy_fileSize:(long long)bit;


/**
 *  文件大小解析 (上传显示)
 */
+ (NSString *)qy_uploadFileSize:(long long)bit;

@end
