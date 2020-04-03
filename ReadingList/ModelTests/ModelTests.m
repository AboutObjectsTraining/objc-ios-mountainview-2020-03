// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <ReadingListModel/ReadingListModel.h>

@interface ModelTests : XCTestCase
@property (readonly, nonatomic) NSDictionary *authorDictionary;
@property (readonly, nonatomic) NSDictionary *bookDictionary;
@end

@implementation ModelTests

- (NSDictionary *)authorDictionary {
    return @{
        RLMAuthorKeys.firstName : @"Fred",
        RLMAuthorKeys.lastName : @"Smith"
    };
}

- (NSDictionary *)bookDictionary {
    return @{
        RLMBookKeys.title : @"My Awesome Book!",
        RLMBookKeys.year : @"1999",
        RLMBookKeys.author : self.authorDictionary
    };
}

- (void)testCreateAuthor {
    RLMAuthor *author = [RLMAuthor modelObjectWithDictionary:self.authorDictionary];
    NSLog(@"%@", author);
}

- (void)testCreateBook {
    RLMBook *book = [RLMBook modelObjectWithDictionary:self.bookDictionary];
    NSLog(@"%@", book.author);
    NSLog(@"%@", book);
}

- (void)testLoadPlist {
    NSBundle *bundle = [NSBundle bundleForClass:RLMBook.class];
    NSString *path = [bundle pathForResource:@"ReadingList" ofType:@"plist"];
    NSLog(@"%@", path);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"%@", dict);
}

- (void)testCreateReadingList {
    NSBundle *bundle = [NSBundle bundleForClass:RLMBook.class];
    NSString *path = [bundle pathForResource:@"ReadingList" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    RLMReadingList *readingList = [RLMReadingList modelObjectWithDictionary:dict];
    NSLog(@"%@", readingList);
}

- (void)testStoreController {
    RLMStoreController *storeController = [[RLMStoreController alloc] init];
    RLMReadingList *readingList = storeController.fetchedReadingList;
    NSLog(@"%@", readingList);
}

@end
