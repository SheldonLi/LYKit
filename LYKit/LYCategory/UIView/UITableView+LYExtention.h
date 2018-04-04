//
//  UITableView+LYExtention.h
//  uworks-library
//
//  Created by SheldonLee on 16/1/7.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (LYExtention)

/**
 *  让TableView多余的Cell不可见
 */
- (void)ly_hideBottomEmptyCells;

/**
 *  分隔线左间距为0
 */
- (void)ly_hideSeparatorLeftInset;

@end
