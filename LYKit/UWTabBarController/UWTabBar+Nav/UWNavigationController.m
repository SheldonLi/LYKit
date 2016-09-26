//
//  UWNavigationController.m
//  CYLTabBarController
//
//  Created by SheldonLee on 15/11/30.
//  Copyright © 2015年 微博@iOS程序犭袁. All rights reserved.
//

#import "UWNavigationController.h"

/** 返回按钮图片名 */
NSString *const backImageName = @"nav_leftArrow";
/** 返回按钮的尺寸 */
CGRect const kBackButtonRect = {{0, 0}, {24, 24}};
/** 标题字体大小 */
CGFloat const kTitleFont = 18;
/** 标题字体颜色 */
#define kTitleColor [UIColor whiteColor]

static NSString *const navBarImageName = @"navigationbar7";

@implementation UWNavigationController

+ (void)initialize {
    if (self == [UWNavigationController class]) {
        [self setUpNavigationBarAppearance];
    }
}
/**
 *  设置navigationBar样式
 */
+ (void)setUpNavigationBarAppearance {
    // 1.取出设置主题的对象
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 2.设置导航栏的背景图片
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;

    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:navBarImageName];

        textAttributes = @{
            NSFontAttributeName : [UIFont systemFontOfSize:kTitleFont],
            NSForegroundColorAttributeName : kTitleColor,
        };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];

        textAttributes = @{
            UITextAttributeFont : kTitleFont,
            UITextAttributeTextColor : kTitleColor,
            UITextAttributeTextShadowColor : [UIColor clearColor],
            UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
        };
#endif
    }

    [navigationBar setBarTintColor:[UIColor purpleColor]];
    //  translucent = NO -> 控制器计算尺寸时，不需要+64像素
    navigationBar.translucent = NO;

    //    [navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBar setTitleTextAttributes:textAttributes];
}

//自定义导航栏返回键
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self.viewControllers count] > 0) {
        viewController.hidesBottomBarWhenPushed = YES;

        UIButton *btn = [[UIButton alloc] initWithFrame:kBackButtonRect];
        [btn setImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem =
            [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.viewControllers.firstObject.navigationController.interactivePopGestureRecognizer
            .delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popself {
    [self popViewControllerAnimated:YES];
}

/**
 *  状态栏样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    // 白色样式
    return UIStatusBarStyleLightContent;
}

@end
