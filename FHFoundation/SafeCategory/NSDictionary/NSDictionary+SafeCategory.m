//
//  NSDictionary+SafeCategory.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import "NSDictionary+SafeCategory.h"
#import "NSObject+SafeCategory.h"



@implementation NSDictionary (SafeCategory)
+ (void)load {
    [self SafeSwizzleClassMethod:@selector(dictionaryWithObjects:forKeys:count:) withClassMethod:@selector(safeDictionaryWithObjects:forKeys:count:)];
    [self SafeSwizzleMethod:@selector(initWithObjects:forKeys:count:) withMethod:@selector(safeInitWithObjects:forKeys:count:)];
}
+ (instancetype)safeDictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self safeDictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)safeInitWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self safeInitWithObjects:safeObjects forKeys:safeKeys count:j];
}
@end


@implementation NSMutableDictionary(SafeCategory)
+ (void)load {
    Class class = NSClassFromString(@"__NSDictionaryM");
    [class SafeSwizzleMethod:@selector(setObject:forKey:) withMethod:@selector(safeSetObject:forKey:)];
    [self SafeSwizzleMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(safeSetObject:forKeyedSubscript:)];
}

- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) {
        return;
    }
    if (aKey == nil ) {
        return;
    }
    [self safeSetObject:anObject forKey:aKey];
}

- (void)safeSetObject:(id)anObject forKeyedSubscript:(id<NSCopying>)key {
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) {
        return;
    }
    if (anObject == nil) {
        return;
    }
    [self safeSetObject:anObject forKeyedSubscript:key];
}
@end
