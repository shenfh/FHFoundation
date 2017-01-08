//
//  SafeDictionaryTest.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SafeCategory.h"
@interface SafeDictionaryTest : XCTestCase

@end

@implementation SafeDictionaryTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSMutableDictionary *dicValue = [[NSMutableDictionary alloc]init];
    
    [dicValue setObject:[NSNull null] forKey:@"111"];
    [dicValue setObject:@(2) forKey:[NSNull null] ];
    
    XCTAssertTrue([[dicValue allKeys]count]== 0,@"Assert failure");
    
    id temp = [[dicValue objectForKey:@"aaa"]objectForKey:@"bbb"];
    
    XCTAssertTrue(temp==nil ,@"no null");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
