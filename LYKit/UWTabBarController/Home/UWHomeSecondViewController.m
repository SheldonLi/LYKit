//
//  UWHomeSecondViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/11/30.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWHomeSecondViewController.h"
#import "UWHomeThirdViewController.h"

@implementation UWHomeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIButton *btn1 = [[UIButton alloc] init];
//    [btn1 setImage:[UIImage imageNamed:@"nav_leftArrow"] forState:UIControlStateNormal];
//    btn1.frame = CGRectMake(0, 0, 10, 20);
//    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 64, 30, 30)];
    [btn setTitle:@"11" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn addTarget:self action:@selector(lal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)lal {
    
    UWHomeThirdViewController *third = [[UWHomeThirdViewController alloc] init];
    third.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:third animated:YES];
}



@end
