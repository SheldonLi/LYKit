//
//  UWTextField.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/8.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWTextField : UITextField {
    CGFloat _cornerRadio;
    CGFloat _borderWidth;
    UIColor *_borderNormalColor;
    UIColor *_borderLightColor;
}

/**
 *  快速创建TextField
 *
 *  @param frame        位置尺寸
 *  @param radio        圆角大小
 *  @param bWidth       边框宽度
 *  @param bNormalColor 正常状态边框颜色
 *  @param bLightColor  选中状态边框颜色
 *
 *  @return TextField
 */
- (instancetype)initWithFrame:(CGRect)frame
                  cornerRadio:(CGFloat)radio
                  borderWidth:(CGFloat)bWidth
            borderNormalColor:(UIColor *)bNormalColor
             borderLightColor:(UIColor *)bLightColor;

/**
 *  设置最大输入长度限制
 *
 *  @param length 最大输入长度
 */
- (void)limitTextLength:(int)length;

@end
