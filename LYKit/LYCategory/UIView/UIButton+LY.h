//
//  UIButton+LY.h
//  uworks-library
//
//  Created by Sheldon on 15/11/3.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LY)

/**
 *  快速创建一个btn
 *
 *  @param frame     frame
 *  @param color     color
 *  @param highColor highColor
 *
 *  @return UIButton
 */
+ (UIButton *)ly_buttonWithFrame:(CGRect)frame
     backgroundImageWithColor:(UIColor *)color
 highBackgroundImageWithColor:(UIColor *)highColor;

/**
 *  快速创建一个btn
 *
 *  @param title     title
 *  @param font      font
 *  @param frame     frame
 *  @param image     image
 *  @param highImage highImage
 *
 *  @return UIButton
 */
+ (UIButton *)ly_buttonWithTitle:(NSString *)title
                         font:(NSInteger)font
                        frame:(CGRect)frame
              backgroundImage:(UIImage *)image
          highBackgroundImage:(UIImage *)highImage;

@end
