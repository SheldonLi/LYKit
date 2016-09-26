//
//  LYPopViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/13.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "LYPopViewController.h"

@implementation LYPopViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mainPopView.center =
        CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    [self.view addSubview:self.mainPopView];
    
    if (_customAlpha) {
        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:_customAlpha];
    }
}

/**
 *  触摸关闭当前页面
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];

    if ([touch view] == self.mainPopView) {
        if (self.chooseCompleteBlock) {
            self.chooseCompleteBlock([touch view]);
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
