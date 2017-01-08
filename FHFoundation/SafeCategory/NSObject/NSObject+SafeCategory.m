//
//  NSObject+SafeCategory.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import "NSObject+SafeCategory.h"
#import <objc/runtime.h>


@implementation NSObject (SafeCategory)

+ (BOOL)SafeSwizzleMethod:(SEL)curSel withMethod:(SEL)newSel {
    Method origMethod = class_getInstanceMethod(self, curSel);
    if (!origMethod) {
        return NO;
    }
    Method altMethod = class_getInstanceMethod(self, newSel);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    curSel,
                    class_getMethodImplementation(self, curSel),
                    method_getTypeEncoding(origMethod));
    
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, curSel), class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)SafeSwizzleClassMethod:(SEL)curSel withClassMethod:(SEL)newSel {
    return [object_getClass((id)self) SafeSwizzleMethod:curSel withMethod:newSel ];
}

@end
