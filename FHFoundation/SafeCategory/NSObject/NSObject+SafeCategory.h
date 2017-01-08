//
//  NSObject+SafeCategory.h
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (SafeCategory)
+ (BOOL)SafeSwizzleMethod:(SEL)curSel withMethod:(SEL)newSel;
+ (BOOL)SafeSwizzleClassMethod:(SEL)curSel withClassMethod:(SEL)newSel;
@end
NS_ASSUME_NONNULL_END
