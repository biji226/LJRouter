//
//  MoudleHome.h
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModuleHome : NSObject<LJModuleProtocol>

@property (nonatomic, copy) NSDictionary *params;

@end

NS_ASSUME_NONNULL_END
