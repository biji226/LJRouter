//
//  ModuleHomeDetail.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "ModuleHomeDetail.h"
#import "LJHomeDetailViewController.h"

@implementation ModuleHomeDetail

+ (instancetype)moduleWithParams:(id)params
{
    ModuleHomeDetail *modle = [[self alloc] init];
    modle.params = params;
    return modle;
}

- (UIViewController *)controllerWithParams:(id)displayParams
{
    LJHomeDetailViewController *meVC = [[LJHomeDetailViewController alloc] init];
    return meVC;
}


@end
