//
//  LYCarouselView.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/10.
//  Copyright © 2015年 U-Works. All rights reserved.
//
//  在DKCarouselView基础上做了优化，原文地址:https://github.com/zhangao0086/DKCarouselView/tree/1.4.0
//  需要依赖SDWebImage下载网络图片

#import <UIKit/UIKit.h>

@interface LYCarouselItem : NSObject

@property (nonatomic, strong) id userInfo;

@end

/**
 *  Online Image
 */
@interface LYCarouselURLItem : LYCarouselItem

@property (nonatomic, copy) NSString *imageUrl;

@end

/**
 *  Custom View
 */
@interface LYCarouselViewItem : LYCarouselItem

@property (nonatomic, strong) UIView *view;

@end

////////////////////////////////////////////////////////////////////////////////////

/**
 *  图片轮播器
 */
@interface LYCarouselView : UIView

typedef void (^ly_carouselViewDidSelectBlock)(LYCarouselItem *item, NSInteger index);
typedef void (^ly_carouselViewDidChangeBlock)(LYCarouselView *view, NSInteger index);

/**
 *  默认placeholder图片
 */
@property (nonatomic, strong) UIImage *defaultImage;

/**
 *  边界是否有限，默认为NO
 */
@property (nonatomic, assign, getter=isFinite) BOOL finite;

@property (nonatomic, assign, getter=isPause) BOOL pause;

/**
 *  指示器颜色
 */
@property (nonatomic, strong) UIColor *indicatorTintColor;
/**
 *  指示器位置
 */
@property (nonatomic, assign) CGPoint indicatorOffset;
/**
 *  获取指示器最小尺寸
 */
@property (nonatomic, readonly) CGSize indicatorSize;
/**
 *  获取图片数量
 */
@property (nonatomic, readonly) NSUInteger numberOfItems;

/**
 *  设置轮播的图片数组
 *
 *  @param items 图片数组
 */
- (void)setImageItemsWithArray:(NSArray *)items;

/**
 *  自动轮播的时间间隔
 *
 *  @param timeInterval 时间间隔
 */
- (void)setAutoPagingForInterval:(NSTimeInterval)timeInterval;

/**
 *  点击事件的回调
 */
- (void)setDidSelectBlock:(ly_carouselViewDidSelectBlock)didSelectBlock;

/**
 *  轮播事件的回调
 */
- (void)setDidChangeBlock:(ly_carouselViewDidChangeBlock)didChangeBlock;

@end
