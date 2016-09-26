//
//  UWOrderViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/11/29.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWOrderViewController.h"
#import "UITableView+LYExtention.h"
#import "UITableViewCell+LYExtention.h"

@interface UWOrderViewController()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation UWOrderViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"订单";
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.mainTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView ly_hideSeparatorLeftInset];
        [tableView ly_hideBottomEmptyCells];
        
        [self.view addSubview:tableView];
        tableView;
    });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = @"11";
    [cell ly_hideSeparatorLeftInset];
    
    return cell;
}



@end
