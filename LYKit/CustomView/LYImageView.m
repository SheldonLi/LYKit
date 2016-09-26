//
//  LYImageView.m
//  uworks-library
//
//  Created by SheldonLee on 15/9/29.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "LYImageView.h"

@implementation LYImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (LYImageView *)initCircularImageViewFrame:(CGRect)frame Target:(id)target Action:(SEL)action {
    LYImageView *circularImageView = [[LYImageView alloc] initWithFrame:frame];
    
    circularImageView.layer.cornerRadius = frame.size.height * 0.5;
    circularImageView.layer.masksToBounds = YES;
    
    circularImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *re =
        [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [circularImageView addGestureRecognizer:re];
    return circularImageView;
}



/**
 *  setterAndgetter
 */
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}
- (void)setBorderWidth:(NSInteger)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}
- (void)setCornerRadius:(NSInteger)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}
@end
