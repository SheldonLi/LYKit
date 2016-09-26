//
//  UWLeftTableViewController.h
//  uworks-library
//
//  Created by SheldonLee on 15/12/16.
//  Copyright © 2015年 Sheldon. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^cellSelectBlock)(NSIndexPath *indexPath);

@interface UWDrawSideTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

/** cell高度 */
@property (nonatomic, assign) CGFloat rowHeight;

/** 组数 */
@property (nonatomic, assign) CGFloat groupNumber;

/** title数组 */
@property (nonatomic, copy) NSArray *titleArray;

/** 图片数组 */
@property (nonatomic, copy) NSArray *imageArray;

@property (strong, readwrite, nonatomic) UITableView *tableView;

/** 点击回调 */
@property (nonatomic, copy) cellSelectBlock cellSelect;

@end
