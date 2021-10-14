//
//  BusinessObject.h
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import <Foundation/Foundation.h>



@class BusinessObject;
typedef void(^CompleteBlock) (BOOL  handled);
typedef void(^ResultBlock) (BusinessObject *handler ,BOOL  handled);

@interface BusinessObject : NSObject
// 下一个响应者()响应链构成的关键
@property (nonatomic, strong) BusinessObject * nextBussiness;

// 响应者的处理方法
-(void)handle:(ResultBlock)result;

// 各个业务在该方法当中做实际处理
-(void)handleBussiness:(CompleteBlock)completion;
@end

