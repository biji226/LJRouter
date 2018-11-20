//
//  MoudleHome.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "ModuleHome.h"
#import "LJHomeViewController.h"

@implementation ModuleHome

+ (instancetype)moduleWithParams:(id)params
{
    ModuleHome *modle = [[self alloc] init];
    modle.params = params;
    return modle;
}

- (UIViewController *)controllerWithParams:(id)displayParams
{
    LJHomeViewController *meVC = [[LJHomeViewController alloc] init];
    return meVC;
}


@end
