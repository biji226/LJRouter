//
//  MoudleMe.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "ModuleMe.h"
#import "LJMeViewController.h"

@implementation ModuleMe

+ (instancetype)moduleWithParams:(id)params
{
    ModuleMe *modle = [[self alloc] init];
    modle.params = params;
    return modle;
}

- (UIViewController *)controllerWithParams:(id)displayParams
{
    LJMeViewController *meVC = [[LJMeViewController alloc] init];
    return meVC;
}


@end
