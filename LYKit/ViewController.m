//
//  ViewController.m
//  LYKit
//
//  Created by SheldonLee on 16/9/26.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import "ViewController.h"
#import "UWButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UWButton *btn = [UWButton buttonWithTitle:@"111111" NormalImage:nil highlightImage:nil selectedImage:nil frame:CGRectMake(100, 100, 120, 44) target:self action:@selector(lalala)];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
