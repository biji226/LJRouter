//
//  LJRouter.m
//  LJMoudle
//
//  Created by Jeffry on 2018/11/20.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJRouter.h"
#import "LJModuleClass.h"
#import <objc/runtime.h>

@interface NSObject (LJRouter)

@property (nonatomic, strong) NSString *LJ_moduleName;
@property (nonatomic, strong) NSDictionary *Lj_moduleParams;

@end


@interface LJRouter()

@property (nonatomic, strong) NSMutableDictionary *reggedMoudles;

@end

@implementation LJRouter

+ (instancetype)sharedManager {
    static LJRouter *sInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];;
    });
    
    return sInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reggedMoudles = @{}.mutableCopy;
    }
    return self;
}

- (void)loadWireFramesFromConfig
{
    [self.reggedMoudles addEntriesFromDictionary:GetDefaultModuleClasses()];
}


- (BOOL)registerWireFrame: (NSString *)className withName: (NSString *)name
{
    if (className == nil || name == nil || objc_getClass(className.UTF8String) == nil) {
        return NO;
    }
    [self.reggedMoudles setObject: className forKey: name];
    return YES;
}


- (Class)moudleClassWithName:(NSString *)name {
    //TODO:向下兼容时，调出一个升级提示
    if (name.length == 0) {
        return nil;
    }
    NSString *ClassName = self.reggedMoudles[name];
    if (!ClassName) { //做一下小写的兼容
        ClassName = self.reggedMoudles[name.lowercaseString];
    }
    if (!ClassName) {
        //没有相应功能的时候，返回空白的提示页面
        return nil;
    }
    Class LJClass = objc_getClass(ClassName.UTF8String);
    if (class_getClassMethod(LJClass, @selector(moduleWithParams:)) == NULL) {
        return nil;;
    }
    return LJClass;
}


- (id<LJModuleProtocol>)moduleWithName: (NSString *)name andParams: (NSDictionary *)params
{
    Class LJClass = [self moudleClassWithName:name];
    NSObject *moudle = [LJClass moduleWithParams:params];
    if (moudle) {
        moudle.LJ_moduleName = name;
        moudle.Lj_moduleParams = params;
    }
    return (id<LJModuleProtocol>)moudle;
    
}


- (UIViewController *)controllerWithWireFrameName: (NSString *)name andParams: (NSDictionary *)params
{
    id<LJModuleProtocol> module = [self moduleWithName:name andParams:params];
    UIViewController *ctrl = [module controllerWithParams:params];
    ctrl.LJ_moduleName = name;
    [self parserParams:params toController:ctrl];
    return ctrl;
}


- (UIViewController *)controllerWithWireFrame:(id<LJModuleProtocol>)moudle
{
    NSDictionary *params = [(NSObject *)moudle Lj_moduleParams];
    UIViewController *ctrl = [moudle controllerWithParams: params];
    ctrl.LJ_moduleName = [(NSObject *)moudle LJ_moduleName];
    ctrl.Lj_moduleParams = params;
    [self parserParams: params toController: ctrl];
    return ctrl;
}


- (void)parserParams: (NSDictionary *)params toController: (UIViewController *)controller {
    if (params == nil) {
        return;
    }
    NSString *title = params[@"title"];
    if (title) {
        controller.title = title;
    }
}


@end


@implementation NSObject (LJRouter)

- (NSString *)LJ_moduleName {
    return objc_getAssociatedObject(self, @selector(LJ_moduleName));
}

- (void)setLJ_moduleName:(NSString *)LJ_moduleName {
    objc_setAssociatedObject(self, @selector(LJ_moduleName), LJ_moduleName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)Lj_moduleParams {
    return  objc_getAssociatedObject(self, @selector(Lj_moduleParams));
}

- (void)setLj_moduleParams:(NSDictionary *)Lj_moduleParams {
    objc_setAssociatedObject(self, @selector(Lj_moduleParams), Lj_moduleParams, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
