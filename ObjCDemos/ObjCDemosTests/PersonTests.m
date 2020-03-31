// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    NSLog(@"first name is %@", [fred firstName]);
    
    [fred setFirstName:@"Fred"];
    NSLog(@"first name is %@", [fred firstName]);
}

@end
