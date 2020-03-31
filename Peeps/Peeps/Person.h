// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@private
    NSString *_firstName;
    NSString *_lastName;
    NSInteger _age;
}

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName;

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSString *)fullName;

- (NSInteger)age;
- (void)setAge:(NSInteger)newValue;


//- (id)initWithContentsOfFile:(NSString *)path
//                    encoding:(NSStringEncoding)enc
//                       error:(NSError **)error;

@end
