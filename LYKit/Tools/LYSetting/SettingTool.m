//
//  SettingTool.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/27.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "SettingTool.h"

@implementation SettingTool


+ (instancetype)shareTool {
    static SettingTool *_sharedTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedTool = [[SettingTool alloc] init];
        [_sharedTool settingDictionary];
    });
    return _sharedTool;
}

- (NSDictionary *)settingDictionary {
    if (!_settingDictionary) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"];
        _settingDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return _settingDictionary;
}

+ (NSString *)baseUrl {
    NSDictionary *dict = [[SettingTool shareTool] settingDictionary];
    
    NSString *string = [dict objectForKey:@"BaseUrl"];
    
    return string;
}

@end
