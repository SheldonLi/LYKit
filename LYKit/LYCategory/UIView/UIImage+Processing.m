//
//  UIImage+Processing.m
//  Oatos
//
//  Created by 李少游 on 20/09/2017.
//  Copyright © 2017 QYY. All rights reserved.
//

#import "UIImage+Processing.h"

@implementation UIImage (Processing)

//  锐化调整
- (UIImage *)ly_sharpedWithKey:(CGFloat)key {
    
    if (!self) return nil;
    
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    // NSLog(@"%@",[CIFilter filterNamesInCategory:kCICategorySharpen]);
    CIFilter *filter = [CIFilter filterWithName:@"CISharpenLuminance"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(key) forKey:kCIInputSharpnessKey];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *outupImage = filter.outputImage;
    CGImageRef imageRef = [context createCGImage:outupImage fromRect:outupImage.extent];
    UIImage *sharpenImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return sharpenImage;
}

//  亮度调整
- (UIImage *)ly_brightnessWithKey:(CGFloat)key {
    
    if (!self) return nil;
    
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    //  亮度  10   -1---1
    [filter setValue:[NSNumber numberWithFloat:key] forKey:@"inputBrightness"];
    
    // 得到过滤后的图片
    CIImage *outputImage = [filter outputImage];
    // 转换图片, 创建基于GPU的CIContext对象
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    // 显示图片
    // 释放C对象
    CGImageRelease(cgimg);
    
    return newImg;
}

//  亮度调整
- (UIImage *)ly_saturationWithKey:(CGFloat)key {
    
    if (!self) return nil;
    
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    //  饱和度      0---2
    [filter setValue:[NSNumber numberWithFloat:0.5] forKey:@"inputSaturation"];
    
    // 得到过滤后的图片
    CIImage *outputImage = [filter outputImage];
    // 转换图片, 创建基于GPU的CIContext对象
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    // 显示图片
    // 释放C对象
    CGImageRelease(cgimg);
    
    return newImg;
}

//  亮度调整
- (UIImage *)ly_contrastWithKey:(CGFloat)key {
    
    if (!self) return nil;
    
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    //  对比度 -11  0---4
    [filter setValue:[NSNumber numberWithFloat:key] forKey:@"inputContrast"];
    
    // 得到过滤后的图片
    CIImage *outputImage = [filter outputImage];
    // 转换图片, 创建基于GPU的CIContext对象
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    // 显示图片
    // 释放C对象
    CGImageRelease(cgimg);
    
    return newImg;
}

+ (UIImage *)ly_imageEnhance:(UIImage *)inputImage {
    
    CIImage *beginImage = [CIImage imageWithCGImage:inputImage.CGImage];
    CIFilter *filter1 = [CIFilter filterWithName:@"CIColorControls"];
    [filter1 setValue:beginImage forKey:kCIInputImageKey];
    //  饱和度      0---2
    [filter1 setValue:[NSNumber numberWithFloat:0] forKey:@"inputSaturation"];
    //  亮度  10   -1---1
    [filter1 setValue:[NSNumber numberWithFloat:0.5] forKey:@"inputBrightness"];
    //  对比度 -11  0---4
    [filter1 setValue:[NSNumber numberWithFloat:1.5] forKey:@"inputContrast"];
    
    // 得到过滤后的图片
    CIImage *outputImage = [filter1 outputImage];
    // 转换图片, 创建基于GPU的CIContext对象
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    // 释放C对象
    CGImageRelease(cgimg);
    
    return [newImg ly_sharpedWithKey:10];
}

@end
