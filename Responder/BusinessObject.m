//
//  BusinessObject.m
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import "BusinessObject.h"

@implementation BusinessObject

// 责任链入口方法
- (void)handle:(ResultBlock)result{
    CompleteBlock completion = ^(BOOL handled) {
        // 当前业务处理掉了，上抛结果
        if(handled) {
            result(self,YES);
        } else {
            // 沿着责任链，指派给下一个业务处理
            if(self.nextBussiness) {
                [self.nextBussiness handle:result];
            }else {
                // 没有业务可以处理，上抛
                result(nil,NO);
            }
            
        }
    };
    
    [self handleBussiness:completion];
    
}

// 回调业务处理结果
- (void)handleBussiness:(CompleteBlock)completion{
    
    /*
     业务逻辑处理
     如网络请求、本地照片查询等
     */
    
    // 根据异步请求结果 进行处理， 将业务和业务的处理者进行解耦
    // 当前没有处理好
    // completion(NO);
    //  不同业务可以继承当前对象，重写业务处理逻辑
    
}

@end
