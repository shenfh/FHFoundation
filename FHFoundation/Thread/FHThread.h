//
//  FHThread.h
//  SafeCategory
//
//  Created by shenfh on 17/1/8.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FHThreadBlock)();

typedef NS_ENUM(NSUInteger,FHQueueLevel) {
    FHQueueLevelDefault = 0,
    FHQueueLevelHigh,
    FHQueueLevelLow,
    FHQueueLevelBackground,
    FHQueueLevelMain,
};
/**
 主线程里面异步执行
 
 @param block FHThreadBlock
 */
static inline void runInMain(FHThreadBlock block );

/**
 后台线程里面异步执行
 
 @param block FHThreadBlock
 @param level FHQueueLevel
 */
static inline void runAsyn(FHThreadBlock block,FHQueueLevel level);

/**
 线程队列
 */
static inline dispatch_queue_t ququeWithLevel(FHQueueLevel level);

NS_ASSUME_NONNULL_END
