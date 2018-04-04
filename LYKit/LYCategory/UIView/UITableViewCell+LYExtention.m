//
//  UITableViewCell+LYExtention.m
//  uworks-library
//
//  Created by SheldonLee on 16/1/7.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import "UITableViewCell+LYExtention.h"

@implementation UITableViewCell (LYExtention)

- (void)ly_hideSeparatorLeftInset {
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
