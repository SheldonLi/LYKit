//
//  UIButton+LY.m
//  uworks-library
//
//  Created by Sheldon on 15/11/3.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "UIButton+LY.h"

@implementation UIButton (LY)

+ (UIButton *)ly_buttonWithFrame:(CGRect)frame
     backgroundImageWithColor:(UIColor *)color
 highBackgroundImageWithColor:(UIColor *)highColor {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[self imageWithColor:color] forState:UIControlStateNormal];
    [btn setBackgroundImage:[self imageWithColor:highColor] forState:UIControlStateHighlighted];
    return btn;
}

+ (UIButton *)ly_buttonWithTitle:(NSString *)title
                         font:(NSInteger)font
                        frame:(CGRect)frame
              backgroundImage:(UIImage *)image
          highBackgroundImage:(UIImage *)highImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.frame = frame;
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    return btn;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
