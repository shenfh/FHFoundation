//
//  SafeArrayTest.m
//  SafeCategory
//
//  Created by shenfh on 17/1/6.
//  Copyright © 2017年 shenfh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SafeCategory.h"
@interface SafeArrayTest : XCTestCase

@end

@implementation SafeArrayTest

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
    NSArray *arrayValue = [[NSArray alloc]init];
    
    id temp = [arrayValue objectAtIndex:100];
    XCTAssertTrue(temp ==nil ,@"Assert false");
}

- (void)testArrayType {
    
    id obj1 = [NSArray alloc]; // __NSPlacehodlerArray *
    id obj2 = [NSMutableArray alloc];  // __NSPlacehodlerArray *
    id obj3 = [obj1 init];  // __NSArrayI *
    id obj4 = [obj2 init];  // __NSArrayM *
    
    
    if ([obj1 isKindOfClass:NSClassFromString(@"__NSPlaceholderArray")]) {
        NSLog(@"true");
    }
    XCTAssertTrue([obj1 isKindOfClass:NSClassFromString(@"__NSPlaceholderArray")] == true,@"no __NSPlacehodlerArray class");
    
    XCTAssertTrue([obj2 isKindOfClass:NSClassFromString(@"__NSPlaceholderArray")],@"no __NSPlacehodlerArray class");
    
    XCTAssertTrue([obj3 isKindOfClass:NSClassFromString(@"__NSArray0")] == true,@"no __NSPlacehodlerArray class");
    
    XCTAssertTrue([obj4 isKindOfClass:NSClassFromString(@"__NSArrayM")],@"no __NSPlacehodlerArray class");
}

- (void)testArrayInit {
    NSArray *arrays = @[[NSNull null],@(1),@"string"];
    XCTAssertTrue([arrays count] == 2,@"failure");

    NSString *values[3];
    values[0] = @"Eezy";
    values[1] = @"Tutorials";
    values[2] = [NSNull null]; // Website ignored since count is 2
    NSArray *array = [NSArray arrayWithObjects:values count:3];
  
    id indexValue = array[100];
    XCTAssertTrue(indexValue == nil,@"not null");
    
    XCTAssertTrue([array count] == 2,@"failure");
    
    array = [array arrayByAddingObject:nil];
    XCTAssertTrue([array count] == 2,@"failure");
    
    array = [array arrayByAddingObject:[NSNull null]];
    XCTAssertTrue([array count] == 2,@"failure");
    
    array = [array arrayByAddingObjectsFromArray:@[[NSNull null]]];
    XCTAssertTrue([array count] == 2,@"failure");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
