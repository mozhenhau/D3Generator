//
//  TestViewController2.m
//  D3Generator
//
//  Created by 莫振华 on 16/2/6.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import "TestViewController2.h"

@interface TestViewController2 ()

@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@end

@implementation TestViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fromLabel.text = [NSString stringWithFormat:@"i create by storyboard   我来自:%@",_comFrom];
}

@end
