//
//  UWRollingView.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/20.
//  Copyright © 2015年 U-Works. All rights reserved.
//
//  传入文字数组，实现循环滚动

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, UWRollViewDirection) {
    UWRollViewDirectionFromUp,
    UWRollViewDirectionFromLeft,
    UWRollViewDirectionFromDown,
    UWRollViewDirectionFromRight
};

typedef NS_ENUM(NSInteger, UWRollViewAnimationType) {
    UWRollViewAnimationTypeCube,
    UWRollViewAnimationTypePush,
    UWRollViewAnimationTypeReveal,
    UWRollViewAnimationTypeMoveIn,
    UWRollViewAnimationTypeFade
};

@interface UWRollingView : UIView

@property (nonatomic, strong) UIColor *labelBackgroundColor;

@property (nonatomic, assign) UWRollViewAnimationType RollAnimationType;

@property (nonatomic, assign) UWRollViewDirection RollDirection;

- (void)setInfoStringsArray:(NSArray *)array andRollDuration:(CGFloat)seconds;

- (void)setInfoStringsArray:(NSArray *)stringArray
            infoImageArrays:(NSArray *)imageArray
            andRollDuration:(CGFloat)seconds;

@end
