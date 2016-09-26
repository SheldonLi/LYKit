//
//  SDWebImageManager+LY.h
//  uworks-library
//
//  Created by SheldonLee on 15/11/3.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "SDWebImageManager.h"

typedef void (^ly_SDProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
typedef void (^ly_SDCompleteBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL);

@interface SDWebImageManager (LY)

+ (void)ly_downloadImageWithURL:(NSURL *)imageUrl progress:(ly_SDProgressBlock)progressBlock complete:(ly_SDCompleteBlock)completeBlock;

@end
