//
//  SafeCategoryTests.m
//  SafeCategoryTests
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SafeCategory.h"
@interface SafeCategoryTests : XCTestCase

@end

@implementation SafeCategoryTests

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
    id nullObject = [NSNull null];
    
   
    [nullObject copy];
    
    id object = [nullObject firstItem];
    NSUInteger intvalue = [object doubleValue];
    
    XCTAssertTrue(intvalue == 0,@"Value false");
    
    id nilObject = nil;
    intvalue = [nilObject integerValue];
    double doubleValue = [nilObject doubleValue];
    id first = [nilObject firstItem];
    
    XCTAssertTrue(intvalue == 0,@"Value false");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
