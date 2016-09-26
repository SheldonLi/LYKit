//
//  SDWebImageManager+LY.m
//  uworks-library
//
//  Created by SheldonLee on 15/11/3.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "SDWebImageManager+LY.h"

@implementation SDWebImageManager (LY)

+ (void)ly_downloadImageWithURL:(NSURL *)imageUrl progress:(ly_SDProgressBlock)progressBlock complete:(ly_SDCompleteBlock)completeBlock {
    [[SDWebImageManager sharedManager] setCacheKeyFilter:^(NSURL *url) {
        url = [[NSURL alloc] initWithScheme:url.scheme host:url.host path:url.path];
        return [url absoluteString];
    }];

    [[SDWebImageManager sharedManager] downloadImageWithURL:imageUrl
        options:SDWebImageLowPriority | SDWebImageRetryFailed
        progress:^(NSInteger receivedSize, NSInteger expectedSize) {

            if (progressBlock) {
                progressBlock(receivedSize, expectedSize);
            }
        }
        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished,
                    NSURL *imageURL){

            if (completeBlock) {
                completeBlock(image, error, cacheType, finished, imageURL);
            }
        }];
}

@end
