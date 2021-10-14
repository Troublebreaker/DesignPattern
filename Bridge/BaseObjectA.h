//
//  BaseObjectA.h
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "BaseObjectB.h"

// 桥接模式的核心实现， 主要是定义两个基类/抽象， 通过抽象代替具体，实现多个A 可以多个B  之间 进行组合桥接 一对一的关系
@interface BaseObjectA : NSObject
@property(nonatomic, strong) BaseObjectB*objB;

// 获取数据
- (void)handle;

@end

