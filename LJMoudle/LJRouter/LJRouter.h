//
//  LJRouter.h
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LJModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LJRouter : NSObject

+ (instancetype)sharedManager;

- (void)loadWireFramesFromConfig;


- (BOOL)registerWireFrame: (NSString *)className withName: (NSString *)name;


- (id<LJModuleProtocol>)moduleWithName: (NSString *)name andParams: (NSDictionary *)params;


- (UIViewController *)controllerWithWireFrameName: (NSString *)name andParams: (NSDictionary *)params;


- (UIViewController *)controllerWithWireFrame:(id<LJModuleProtocol>)moudle;

@end

NS_ASSUME_NONNULL_END
