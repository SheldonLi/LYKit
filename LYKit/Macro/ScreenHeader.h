//
//  ScreenHeader.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#ifndef LYKit_ScreenHeader_h
#define LYKit_ScreenHeader_h

#define iOS7  ([[UIDevice currentDevice].systemVersion floatValue]>=7.0)
#define iOS8  ([[UIDevice currentDevice].systemVersion floatValue]>=8.0)
#define iOS9  ([[UIDevice currentDevice].systemVersion floatValue]>=9.0)
#define LYScreenWidth [UIScreen mainScreen].bounds.size.width
#define LYScreenHeight [UIScreen mainScreen].bounds.size.height

//判断iphone6+
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iPhone4
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)


// 判断字符串是否为空
#define STRING_IS_NIL(key) (([@"<null>" isEqualToString:(key)] || [@"" isEqualToString:(key)] || key == nil || [key isKindOfClass:[NSNull class]]) ? YES: NO)

// 判断数组是否为空
#define ARRAY_IS_EMPTY(array) ((!array || [array count] == 0)? YES: NO)

//  防止数组越界
#define ARRAY_BOUNDS_PROTECT(array, index) ((!array || index < [array count])? [array objectAtIndex:index]: nil)

// 判读代理是否响应
#define DELEGATE_IS_READY(x) (self.delegate && [self.delegate respondsToSelector:@selector(x)])

// 打印结构体
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)

//注册通知
#define ADD_OBSERVER(target,_selector,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver: target selector:_selector name: _name object: _obj]

//发送通知
#define POST_NOTIFICATION(_notificationName,_obj,_userInfo) [[NSNotificationCenter defaultCenter] postNotificationName:_notificationName object:_obj userInfo:_userInfo]

//移除对象所有通知
#define REMOVE_ALL_OBSERVER(_id_) [[NSNotificationCenter defaultCenter] removeObserver:_id_]

//移除对象指定通知
#define REMOVE_OBSERVER(_id_,_name_,_obj_) [[NSNotificationCenter defaultCenter] removeObserver:_id_ name:_name_ object:_obj_];

#endif
