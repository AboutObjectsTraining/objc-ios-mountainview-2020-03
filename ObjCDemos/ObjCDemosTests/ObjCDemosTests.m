// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ObjCDemosTests : XCTestCase
@end

static int count;

void foo(void) {
    count++;
    {
        static int count = 1;
        printf("count in %s is %d\n", __func__, count);
        count++;
    }
    printf("count in %s is %d\n", __func__, count);
}

void bar(void) {
    count++;
    static int count = 1;
    printf("count in %s is %d\n", __func__, count);
    count++;
}

@implementation ObjCDemosTests

- (void)testPointers {
    int x = 42;
    
    int *p1 = &x, *p2 = p1;
    
    printf("address: %p, value: %d\n", p1, *p1);
    printf("address: %p, value: %d\n", p2, *p2);
    
    *p2 += 3;
    
    printf("address: %p, value: %d\n", p1, *p1);
    printf("address: %p, value: %d\n", p2, *p2);
    printf("address: %p, value: %d\n", &x, x);
}

- (void)testCounters {
    foo();
    foo();
    bar();
    bar();
    bar();
    printf("count in %s is %d\n", __func__, count);
}


@end
