//
//  UWLeftTableViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/12/16.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWDrawSideTableViewController.h"

@implementation UWDrawSideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]
            initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                    style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                     UIViewAutoresizingFlexibleBottomMargin |
                                     UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.bounces = NO;
        tableView.tableFooterView = [UIView new];
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSourceDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.rowHeight ? self.rowHeight : 44);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.groupNumber ? self.groupNumber : 1);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.titleArray.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }

    NSArray *titles = self.titleArray;
    NSArray *images = self.imageArray;
    if (indexPath.row < titles.count) {
        cell.textLabel.text = titles[indexPath.row];
    }
    if (indexPath.row < images.count) {
        cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.cellSelect) {
        self.cellSelect(indexPath);
    }
}

@end
