//
//  LJHomeDetailViewController.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJHomeDetailViewController.h"

@interface LJHomeDetailViewController ()

@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation LJHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.descLabel];
    self.descLabel.text = @"详情";
}

#pragma mark - Getters
- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.bounds = CGRectMake(0, 0, 200, 100);
        _descLabel.center = self.view.center;
        _descLabel.numberOfLines = 0;
        _descLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _descLabel;
}

@end
