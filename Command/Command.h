//
//  Command.h
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import <Foundation/Foundation.h>

// 行为参数化
// 降低代码重合度

@class Command;
typedef void(^CommandCompletionCallBack) (Command *cmd);

@interface Command : NSObject
@property(nonatomic, copy) CommandCompletionCallBack completion;

- (void)execute;
- (void)cancel;
- (void)done;

@end

