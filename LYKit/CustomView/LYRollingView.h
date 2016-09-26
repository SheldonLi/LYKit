//
//  UWRollingView.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/20.
//  Copyright © 2015年 U-Works. All rights reserved.
//
//  传入文字数组，实现循环滚动

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, LYRollViewDirection) {
    LYRollViewDirectionFromUp,
    LYRollViewDirectionFromLeft,
    LYRollViewDirectionFromDown,
    LYRollViewDirectionFromRight
};

typedef NS_ENUM(NSInteger, LYRollViewAnimationType) {
    LYRollViewAnimationTypeCube,
    LYRollViewAnimationTypePush,
    LYRollViewAnimationTypeReveal,
    LYRollViewAnimationTypeMoveIn,
    LYRollViewAnimationTypeFade
};

@interface LYRollingView : UIView

@property (nonatomic, strong) UIColor *labelBackgroundColor;

@property (nonatomic, assign) LYRollViewAnimationType RollAnimationType;

@property (nonatomic, assign) LYRollViewDirection RollDirection;

- (void)setInfoStringsArray:(NSArray *)array andRollDuration:(CGFloat)seconds;

- (void)setInfoStringsArray:(NSArray *)stringArray
            infoImageArrays:(NSArray *)imageArray
            andRollDuration:(CGFloat)seconds;

@end
