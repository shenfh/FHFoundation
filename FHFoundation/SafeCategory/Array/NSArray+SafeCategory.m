//
//  NSArray+SafeCategory.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import "NSArray+SafeCategory.h"
#import "NSObject+SafeCategory.h"
#import <objc/runtime.h>
@implementation NSArray (SafeCategory)
+ (void)load {
    [self swizzleMethAction:objc_getClass("__NSArrayI")];
    [self swizzleMethAction:objc_getClass("__NSArrayM")];
    [self swizzleMethAction:objc_getClass("__NSArray0")];
    [self swizzleMethAction:objc_getClass("__NSPlacehodlerArray")];
    [self swizzleMethAction:self.class];
}

+ (void)swizzleMethAction:(Class)class {
    if (class != nil) {
        [class SafeSwizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) ];
        [class SafeSwizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(safeObjectAtIndexedSubscript:)];
        [class SafeSwizzleMethod:@selector(arrayByAddingObject:) withMethod:@selector(safeArrayByAddingObject:)];
        [class SafeSwizzleMethod:@selector(arrayByAddingObjectsFromArray:) withMethod:@selector(safeArrayByAddingObjectsFromArray:)];        
       
        [class SafeSwizzleClassMethod:@selector(arrayWithObjects:count:) withClassMethod:@selector(safeArrayWithObjects:count:)];
    }
}
+ (instancetype)safeArrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id safeObjects[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id obj = objects[i];
        if (obj == nil || [obj isKindOfClass:NSNull.class]) {
            continue;
        }
        safeObjects[j] = obj;
        j++;
    }
    return [self safeArrayWithObjects:safeObjects count:j];
}

- (NSArray<id> *)safeArrayByAddingObject:(id)anObject {
    if (anObject == nil) {
        return self;
    }
    return [self safeArrayByAddingObject:anObject];
}

- (NSArray<id> *)safeArrayByAddingObjectsFromArray:(NSArray<id> *)otherArray{
    if (otherArray == nil || ![otherArray isKindOfClass:NSArray.class]) {
        return [self safeArrayByAddingObjectsFromArray:@[]];
    }
    NSMutableArray *arrayTemp = @[].mutableCopy;
    for (id object in otherArray) {
        if (object == nil) {
            continue;
        }
        [arrayTemp addObject:object];
    }
    return [self safeArrayByAddingObjectsFromArray:arrayTemp.copy];
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
//        NSAssert(FALSE, @"数组越界了...");
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (id)safeObjectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count) {
//        NSAssert(FALSE, @"数组越界了...");
        return nil;
    }
    return [self safeObjectAtIndexedSubscript:idx];
}
@end
