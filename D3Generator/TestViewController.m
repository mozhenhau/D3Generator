//
//  TestViewController.m
//  D3Generator
//
//  Created by 莫振华 on 16/2/6.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 300, 100)];
    label.text = [NSString stringWithFormat:@"我是2   我来自:%@",_comFrom];
    [self.view addSubview:label];
    
    self.navigationItem.title = _titleName;
}

@end
