//
//  UWPasswordTextField.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/8.
//  Copyright © 2015年 U-Works. All rights reserved.
//
//  一个支持明暗码切换的TextField.处理了系统的UITextField在切换到暗码时会清除之前的输入文本的问题.
//  直接设置父类UITextField的属性secureTextEntry即可


#import "UWTextField.h"

@interface UWPasswordTextField : UWTextField

@end
