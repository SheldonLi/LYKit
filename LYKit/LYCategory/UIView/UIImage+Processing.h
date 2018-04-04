//
//  UIImage+Processing.h
//  Oatos
//
//  Created by 李少游 on 20/09/2017.
//  Copyright © 2017 QYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Processing)

//  锐化调整
- (UIImage *)ly_sharpedWithKey:(CGFloat)key;

//  亮度调整
- (UIImage *)ly_brightnessWithKey:(CGFloat)key;

//  饱和度调整
- (UIImage *)ly_saturationWithKey:(CGFloat)key;

//  对比度调整
- (UIImage *)ly_contrastWithKey:(CGFloat)key;

//  文档字体增强效果
+ (UIImage *)ly_imageEnhance:(UIImage *)inputImage;

@end
