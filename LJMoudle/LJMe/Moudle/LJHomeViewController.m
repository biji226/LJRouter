//
//  LJHomeViewController.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJHomeViewController.h"
#import "LJRouter.h"

@interface LJHomeViewController ()

@property (nonatomic,weak) UIButton * jumpButton;

@end

@implementation LJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"jump detail" forState:UIControlStateNormal];
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.jumpButton = button;
    // Do any additional setup after loading the view.
}

- (void)buttonAction
{
   UIViewController *detail =  [[LJRouter sharedManager] controllerWithWireFrameName:@"homedetail" andParams:nil];
    [self.navigationController pushViewController:detail animated:YES];
}



@end
