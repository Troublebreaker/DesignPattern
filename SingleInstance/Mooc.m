//
//  Mooc.m
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import "Mooc.h"

@implementation Mooc

+ (id)sharedInstance {
    static Mooc *instance = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 创建实例
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 重写方法【必不可少】
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}


// 重写方法【必不可少】
- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

@end



