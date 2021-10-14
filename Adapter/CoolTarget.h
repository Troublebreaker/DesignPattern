//
//  CoolTarget.h
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "Target.h"

// 适配对象
@interface CoolTarget : NSObject
@property(nonatomic, strong) Target *target;

// 对原有方法包装
- (void)request;

@end

