//
//  CommandManager.h
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "Command.h"


// 命令模式
// 行为参数化


@interface CommandManager : NSObject

// 命令管理容器
@property(nonatomic, strong) NSMutableArray <Command *> *arrayCommands;


// 命令管理者以单例方式呈现
+ (instancetype)sharedInstance;

// 执行命令
+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion;

// 取消命令
+ (void)cancelCommand:(Command *)cmd;

@end

