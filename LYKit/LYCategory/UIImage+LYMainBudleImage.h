//
//  UIImage+LYLanchImage.h
//  uworks-library
//
//  Created by SheldonLee on 15/12/24.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LYIconImageSize) {
    LYIconImageSize29,
    LYIconImageSize40,
    LYIconImageSize60
};

@interface UIImage (LYMainBudleImage)


/**
 *  返回LaunchImage
 */
+ (UIImage *)ly_getLaunchImage;

/**
 *  返回size尺寸的IconImage
 */
+ (UIImage *)ly_getIconImageWithSize:(LYIconImageSize)iconImageSize;

@end
