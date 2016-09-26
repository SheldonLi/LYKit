//
//  UIButton+LYCountDown.m
//  UWLoginModual
//
//  Created by SheldonLee on 16/1/7.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import "UIButton+LYCountDown.h"

@implementation UIButton (LYCountDown)

- (void)ly_startWithTime:(NSInteger)timeLine
                title:(NSString *)title
          normalColor:(UIColor *)normalColor
        countingColor:(UIColor *)countingColor {
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{

        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = normalColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            int seconds = (timeOut == 60 ? 60 : timeOut % 60);
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = countingColor;
                [self setTitle:[NSString stringWithFormat:@"%@s", timeStr]
                      forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end
