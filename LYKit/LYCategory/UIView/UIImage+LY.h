//
//  UIImage+LY.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LY)

/**
 *  返回的图片拉伸不变形
 */
+ (UIImage *)ly_resizableImage:(NSString *)imageName;

/**
 *  将颜色合成图片
 */
+ (UIImage *)ly_imageWithColor:(UIColor *)color;

/**
 *  图片截取处理
 */
+ (UIImage *)ly_rotateImage:(UIImage *)image;

/**
 *  view转化成image
 */
+ (UIImage *)ly_imageWithView:(UIView *)view;

/**
 *  把image切成圆角
 */
- (UIImage *)ly_imageWithCornerSize:(CGSize)size fillColor:(UIColor *)fillColor;

@end
