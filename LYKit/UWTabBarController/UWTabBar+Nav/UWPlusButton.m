//
//  UWPlusButton.m
//  uworks-library
//
//  Created by SheldonLee on 15/11/29.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWPlusButton.h"

@implementation UWPlusButton

+ (void)load {
    [super registerSubclass];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }

    return self;
}

//上下结构的 button
- (void)layoutSubviews {
    [super layoutSubviews];

    // 控件大小,间距大小
    CGFloat const imageViewEdge = self.bounds.size.width * 1;
    CGFloat const centerOfView = self.bounds.size.width * 0.5;
    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
    CGFloat const verticalMarginT = self.bounds.size.height - labelLineHeight - imageViewEdge;
    CGFloat const verticalMargin = verticalMarginT / 2;

    // imageView 和 titleLabel 中心的 Y 值
    CGFloat const centerOfImageView = verticalMargin + imageViewEdge * 0.5;
    CGFloat const centerOfTitleLabel =
        imageViewEdge + verticalMargin * 2 + labelLineHeight * 0.5 + 5;

    // imageView position 位置
    self.imageView.bounds = CGRectMake(0, 0, imageViewEdge, imageViewEdge);
    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);

    // title position 位置
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
}

#pragma mark - Public Methods

/*
 *
 Create a custom UIButton with title and add it to the center of our tab bar
 *
 */
+ (instancetype)plusButton {
    UWPlusButton *button = [[UWPlusButton alloc] init];

    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_voice_icon"]
                      forState:UIControlStateNormal];
    //    [button setImage:[UIImage imageNamed:@"bd_btn"] forState:UIControlStateNormal];
    //    [button setTitle:@"帮贷" forState:UIControlStateNormal];

    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button sizeToFit];

    [button addTarget:button
                  action:@selector(clickPublish)
        forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (void)clickPublish {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;

    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                 initWithTitle:nil
                      delegate:nil
             cancelButtonTitle:@"取消"
        destructiveButtonTitle:nil
             otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}

@end
