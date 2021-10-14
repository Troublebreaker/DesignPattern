//
//  Command.m
//  DesignPattern
//
//  Created by 曹亮 on 2021/10/14.
//

#import "Command.h"
#import "CommandManager.h"

@implementation Command

- (void)execute {
    //override to subclass;
    [self done];
}
- (void)cancel {
    self.completion = nil;
}
- (void)done {
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;

        if(strongSelf.completion) {
            strongSelf.completion(strongSelf);
        }
    
        self.completion = nil;
        [[[CommandManager sharedInstance] arrayCommands ] removeObject:strongSelf];
    });
}

@end
