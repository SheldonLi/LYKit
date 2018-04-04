//
//  UITableView+LYExtention.m
//  uworks-library
//
//  Created by SheldonLee on 16/1/7.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import "UITableView+LYExtention.h"

@implementation UITableView (LYExtention)

- (void)ly_hideBottomEmptyCells {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

- (void)ly_hideSeparatorLeftInset {
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }

    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
