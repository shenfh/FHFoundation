//
//  FHThread.m
//  SafeCategory
//
//  Created by shenfh on 17/1/8.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import "FHThread.h"

static inline void runInMain(FHThreadBlock block ) {
    if (block == nil) {
        return;
    }
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(ququeWithLevel(FHQueueLevelMain), block);
    }
}
static inline void runAsyn(FHThreadBlock block,FHQueueLevel level) {
    if (block == nil) {
        return;
    }
    dispatch_async(ququeWithLevel(level), block);
}

static inline dispatch_queue_t ququeWithLevel(FHQueueLevel level) {
    switch (level) {
        case FHQueueLevelMain:{
            return dispatch_get_main_queue();
        }
        case FHQueueLevelLow: {
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        }
        case FHQueueLevelHigh: {
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        }
        case FHQueueLevelBackground:{
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        }
        default:{
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        }
    }

}

