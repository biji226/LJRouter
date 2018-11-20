//
//  LJModuleClass.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJModuleClass.h"

NSDictionary *GetDefaultModuleClasses() {
    static NSDictionary *sDefault = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sDefault = @{@"me":@"ModuleMe",
                     @"home":@"ModuleHome",
                     @"homedetail":@"ModuleHomeDetail"
                     };
    });
    return sDefault;
}
