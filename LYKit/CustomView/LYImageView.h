//
//  LYImageView.h
//  uworks-library
//
//  Created by SheldonLee on 15/9/29.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYImageView : UIImageView
/**
 *  边框的颜色
 */
@property (strong, nonatomic) UIColor *borderColor;
/**
 *  边框的宽度
 */
@property (assign, nonatomic) NSInteger borderWidth;
/**
 *  头像的角度
 */
@property (assign, nonatomic) NSInteger cornerRadius;
/**
 *  圆形的头像
 *
 *  @param frame  头像的大小
 *  @param target 调用此点击方法的Ctr
 *  @param action 点击头像后执行的方法
 *
 *  @return 圆形的头像
 */
- (UWImageView *)initCircularImageViewFrame:(CGRect)frame Target:(id)target Action:(SEL)action;

@end
