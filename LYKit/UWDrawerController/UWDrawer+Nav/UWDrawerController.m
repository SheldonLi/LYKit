//
//  UWDrawerController.m
//  uworks-library
//
//  Created by SheldonLee on 15/12/14.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWCenterViewController.h"
#import "UWCenterNavigationController.h"
#import "UWDrawerController.h"
#import "UWLeftViewController.h"
#import "UWRightViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "UWDrawSideTableViewController.h"


//  设置按钮尺寸
static CGRect const kBackButtonRect = {{0, 0},{24, 24}};


@implementation UWDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createAll];
}

- (void)createAll {
    //左边
    UWDrawSideTableViewController *left = [[UWDrawSideTableViewController alloc] init];
    left.view.backgroundColor = [UIColor greenColor];
    left.rowHeight = 56;
    left.titleArray = @[@"1", @"2", @"3"];
    left.imageArray = @[@"account_icon_focused", @"account_icon_focused", @"account_icon_focused" ];
    left.cellSelect = ^(NSIndexPath *indecPath) {
        NSLog(@"%ld", (long)indecPath.row);
    };
    
    UWCenterNavigationController *navLeft = [[UWCenterNavigationController alloc] initWithRootViewController:left];
    self.leftDrawerViewController = navLeft;
    
    

    //  TODO:中间控制器：修改标题，左右按钮的图片
    UWCenterViewController *center = [[UWCenterViewController alloc] init];
    center.navigationItem.title = @"lishaoyou";
    [center addLeftMenuButtonWithFrame:kBackButtonRect normalImage:[UIImage imageNamed:@"IconHome"] highlightImage:nil];
    [center addRightMenuButtonWithFrame:kBackButtonRect normalImage:[UIImage imageNamed:@"IconProfile"] highlightImage:nil];
    
    UWCenterNavigationController *navCenter = [[UWCenterNavigationController alloc] initWithRootViewController:center];
    center.view.backgroundColor = [UIColor grayColor];
    self.centerViewController = navCenter;

    //右边
    UWRightViewController *right = [[UWRightViewController alloc] init];
    right.view.backgroundColor = [UIColor yellowColor];
    self.rightDrawerViewController = right;

    //  TODO: 左右抽屉的宽度
    self.maximumLeftDrawerWidth = 260;
    self.maximumRightDrawerWidth = 200;
    
    //  TODO: 打开与关闭的手势操作
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
