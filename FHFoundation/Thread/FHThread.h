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

@interface FHThread : NSObject

/**
 主线程里面异步执行

 @param block FHThreadBlock
 */
+ (void)runInMain:(FHThreadBlock)block;


/**
 后台线程里面异步执行

 @param block FHThreadBlock
 @param level FHQueueLevel
 */
+ (void)runAsyn:(FHThreadBlock)block level:(FHQueueLevel)level;

+ (dispatch_queue_t)ququeWithLevel:(FHQueueLevel)level;

@end

NS_ASSUME_NONNULL_END
