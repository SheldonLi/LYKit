//
//  UIButton+LYCountDown.h
//  UWLoginModual
//
//  Created by SheldonLee on 16/1/7.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LYCountDown)

/**
*  倒计时按钮
*
*  @param timeLine      倒计时总时间
*  @param title         还没倒计时的title
*  @param normalColor   还没倒计时的颜色
*  @param countingColor 倒计时中的颜色
*/
- (void)ly_startWithTime:(NSInteger)timeLine
                title:(NSString *)title
          normalColor:(UIColor *)normalColor
        countingColor:(UIColor *)countingColor;

@end
