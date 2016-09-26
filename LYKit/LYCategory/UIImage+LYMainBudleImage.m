//
//  UIImage+LYLanchImage.m
//  LYorks-library
//
//  Created by SheldonLee on 15/12/24.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UIImage+LYMainBudleImage.h"

static NSString *LYGetIconString(LYIconImageSize iconSize) {
    
    NSString *iconS = nil;
    switch (iconSize) {
        case LYIconImageSize29: {
            iconS = @"29";
            break;
        }
        case LYIconImageSize40: {
            iconS = @"40";
            break;
        }
        case LYIconImageSize60: {
            iconS = @"60";
            break;
        }
    }
    return iconS;
}

@implementation UIImage (LYMainBudleImage)

+ (NSString *)ly_getLaunchImageName {
    NSString *viewOrientation = (UIInterfaceOrientationIsLandscape(
                                    [[UIApplication sharedApplication] statusBarOrientation]))
                                    ? @"Landscape"
                                    : @"Portrait";
    NSString *launchImageName = nil;
    NSArray *launchImagesArray =
        [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    for (NSDictionary *dict in launchImagesArray) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);

        if (CGSizeEqualToSize(imageSize, screenSize) &&
            [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
}

+ (UIImage *)ly_getLaunchImage {
    return [UIImage imageNamed:[self ly_getLaunchImageName]];
}

+ (NSString *)ly_getIconImageNameWithSize:(LYIconImageSize)iconImageSize {
    NSArray *iconArr = [[[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleIcons"]
                         objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"];
    
    NSString *iconString = nil;
    NSString *iconSize = LYGetIconString(iconImageSize);
    
    for (NSString *string in iconArr) {
        NSRange range = [string rangeOfString:iconSize];
        if (range.location != NSNotFound) {
            iconString = string;
            NSLog(@"%@", iconString);
        } else {
            NSLog(@"Not Found");
        }
    }
    return iconString;
}
+ (UIImage *)ly_getIconImageWithSize:(LYIconImageSize)iconImageSize {
    return [UIImage imageNamed:[self ly_getIconImageNameWithSize:iconImageSize]];
}

@end
