//
//  LJMoudleProtocol.h
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#ifndef LJMoudleProtocol_h
#define LJMoudleProtocol_h

#import <UIKit/UIKit.h>

@protocol LJModuleProtocol <NSObject>

+ (instancetype)moduleWithParams:(id)params;

@optional

- (UIViewController *)controllerWithParams:(id)displayParams;

@end


#endif /* LJMoudleProtocol_h */
