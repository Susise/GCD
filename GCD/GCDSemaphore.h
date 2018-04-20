//
//  GCDSemaphore.h
//  GCD
//
//  Created by S on 2018/2/2.
//  Copyright © 2018年 S. All rights reserved.
//

#import <Foundation/Foundation.h>

//信号量工具

@interface GCDSemaphore : NSObject

@property ( nonatomic,strong) dispatch_semaphore_t dispatchSemaphore;

#pragma mark -- 初始化

- (instancetype)init;

- (instancetype)initWithValue:(long)value;

#pragma mark -- 用法
- (BOOL)signal;
- (void)wait;
- (BOOL)wait:(int64_t)delta;


@end
