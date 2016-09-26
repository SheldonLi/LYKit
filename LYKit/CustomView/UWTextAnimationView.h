//
//  UWTextAnimationView.h
//  uworks-library
//
//  Created by SheldonLee on 12/12/15.
//  Copyright © 2015 Sheldon. All rights reserved.
//

//  TODO: 设置什么时候开始动， 什么时候停止， 在过程中完成或清空，  动画快慢设置

#import <UIKit/UIKit.h>

@interface UWTextAnimationView : UIView

/**
 *  需要显示的文字
 */
@property (nonatomic, copy) NSString *text;

/**
 *  显示的字体大小
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 *  需要显示的字体颜色
 */
@property (nonatomic, strong) UIColor *textColor;

@end
