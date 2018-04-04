//
//  NSObject+LYDescription.m
//  uworks-library
//
//  Created by SheldonLee on 15/12/17.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "NSObject+LYDescription.h"
#import <objc/message.h>

@implementation NSObject (LYDescription)

- (NSString *)description {
    NSMutableString *logString = [NSMutableString string];
    NSString *address = [NSString stringWithFormat:@"<%p>", self];
    NSString *modelClass =
    [NSString stringWithFormat:@"%@%@\n", NSStringFromClass([self class]), address];
    [logString appendString:modelClass];

    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    if (count != 0) {
        [logString appendString:@"属性名:属性值\n"];
    }
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        // 获得成员属性名，除去下划线，从第一个角标开始截取
        NSString *keyName =
            [[NSString stringWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];

        id value = [self valueForKey:keyName];

        NSString *string = [NSString stringWithFormat:@"%@:%@\n", keyName, value];
        [logString appendString:string];
    }
    return logString;
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
