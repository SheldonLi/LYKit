//
//  UWCenterViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/12/14.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UIViewController+MMDrawerController.h"
#import "UWCenterViewController.h"

@implementation UWCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addLeftMenuButtonWithFrame:(CGRect)frame
                       normalImage:(UIImage *__nullable)normalImage
                    highlightImage:(UIImage *__nullable)highlightImage {
    UIButton *leftDrawerButton = ({
        UIButton *button = [[UIButton alloc] init];
        button.frame = frame;
        button.backgroundColor = [UIColor clearColor];
        [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
        [button addTarget:self
                      action:@selector(leftDrawerButtonPress:)
            forControlEvents:UIControlEventTouchUpInside];

        button;
    });

    UIBarButtonItem *leftDrawerButtonItem =
        [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = leftDrawerButtonItem;
}

- (void)addRightMenuButtonWithFrame:(CGRect)frame
                        normalImage:(UIImage *__nullable)normalImage
                     highlightImage:(UIImage *__nullable)highlightImage {
    UIButton *rightDrawerButton = ({
        UIButton *button = [[UIButton alloc] init];
        button.frame = frame;
        button.backgroundColor = [UIColor clearColor];
        [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
        [button addTarget:self
                      action:@selector(rightDrawerButtonPress:)
            forControlEvents:UIControlEventTouchUpInside];

        button;
    });

    UIBarButtonItem *rightDrawerButtonItem =
        [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    self.navigationItem.rightBarButtonItem = rightDrawerButtonItem;
}

#pragma mark - Button Handlers
- (void)leftDrawerButtonPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)rightDrawerButtonPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)doubleTap:(UITapGestureRecognizer *)gesture {
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

- (void)twoFingerDoubleTap:(UITapGestureRecognizer *)gesture {
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Center will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Center did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"Center will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"Center did disappear");
}

@end
