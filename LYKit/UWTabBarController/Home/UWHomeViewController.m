//
//  UWHomeViewController.m
//  uworks-library
//
//  Created by SheldonLee on 15/11/29.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import "UWHomeViewController.h"
#import "UWHomeSecondViewController.h"
#import "LYHttpTool.h"

@implementation UWHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor yellowColor];
    

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 30, 30)];
    [btn setTitle:@"11" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(lal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(30, 260, 90, 30)];
    [btn2 setTitle:@"22222" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(lalaa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)lalaa {
    
    // 测试GET API
    [LYHttpTool updateBaseUrl:@"http://apis.baidu.com/"];
    [LYHttpTool enableInterfaceDebug:YES];
    NSDictionary *headerDict = @{@"apikey" : @"ebf7433ecd88181dca2de254b7677616"};
    [LYHttpTool updateCommonHttpHeaders:headerDict];
    NSString *idCard = @"apistore/idservice/id";
    NSDictionary *idCardDict = @{ @"id": @"441826199006120013" };
    
    [LYHttpTool getWithURL:idCard params:idCardDict success:^(id operation, id responseObject) {
        
    } failure:^(id operation, NSError *error) {
        
    }];
}

- (void)lal {
    UWHomeSecondViewController *vc = [[UWHomeSecondViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
