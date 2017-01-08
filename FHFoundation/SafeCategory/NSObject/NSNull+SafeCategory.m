//
//  NSNull+SafeCategory.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import "NSNull+SafeCategory.h"
#import "EXTRuntimeExtensions.h"
#import "NSObject+SafeCategory.h"

@implementation NSNull (SafeCategory)
+ (void)load {
    [self SafeSwizzleMethod:@selector(forwardInvocation:) withMethod:@selector(SafeForwardInvocation:)];
    [self SafeSwizzleMethod:@selector(methodSignatureForSelector:) withMethod:@selector(SafeMethodSignatureForSelector:)];
}

- (void)SafeForwardInvocation:(NSInvocation *)anInvocation {
    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
    if (!returnLength) {
        // nothing to do
        return;
    }
    // set return value to all zero bits
    char buffer[returnLength];
    memset(buffer, 0, returnLength);
    
    [anInvocation setReturnValue:buffer];
}


- (NSMethodSignature *)SafeMethodSignatureForSelector:(SEL)selector {
//    NSMethodSignature *sig = [self SafeMethodSignatureForSelector:selector];
//    if (sig) {
//        return sig;
//    }
//    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
     NSLog(@" %@ -- %@ 方式没有实现", NSStringFromClass(self.class),NSStringFromSelector(selector));
    return ext_globalMethodSignatureForSelector(selector);
}
@end
