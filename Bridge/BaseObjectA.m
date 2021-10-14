//
//  BaseObjectA.m
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import "BaseObjectA.h"

@implementation BaseObjectA

/*
   A1 --> B1、B2、B3         3种
   A2 --> B1、B2、B3         3种
   A3 --> B1、B2、B3         3种
 */
- (void)handle{
    [self.objB fetchData];
}

@end
