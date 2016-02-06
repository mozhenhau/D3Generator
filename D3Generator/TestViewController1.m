//
//  TestViewController1.m
//  D3Generator
//
//  Created by 莫振华 on 16/2/6.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import "TestViewController1.h"

@interface TestViewController1 ()
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;

@end

@implementation TestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fromLabel.text = [NSString stringWithFormat:@"我是2   我来自:%@",_comFrom];
}

@end
