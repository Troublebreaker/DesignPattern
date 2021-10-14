//
//  CommandManager.m
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import "CommandManager.h"

@implementation CommandManager

// 命令管理者以单例方式呈现
+ (instancetype)sharedInstance
{
    static CommandManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 【必不可少】
+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

// 【必不可少】
- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

// 初始化方法
- (id)init
{
    self = [super init];
    if (self) {
        // 初始化命令容器
        _arrayCommands = [NSMutableArray array];
    }
    return self;
}


+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion{
    if(cmd) {
        // 如果命令正在执行不做处理，否则添加并执行命令
        if(![self _isExecutingCommand:cmd]) {
            // 添加命令到容器中
            [[[self sharedInstance] arrayCommands] addObject:cmd];
            //设置命令执行完成回调
            cmd.completion = completion;
            //执行命令
            [cmd execute];
        }
    } else {
        
    }
}

+ (void)cancelCommand:(Command *)cmd{
    if(cmd) {
        // 从命令容器当中移除
        [[[self sharedInstance] arrayCommands] removeObject:cmd];
        
        // 取消命令执行
        [cmd cancel];
    }
}



+(BOOL) _isExecutingCommand:(Command *)cmd {
    if(cmd) {
        NSArray *cmds = [[self sharedInstance] arrayCommands];
        for (Command * aCmd in cmds) {
            if (cmd == aCmd) {
                return  YES;
            }
        }
    }
    return NO;
}


@end
