// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    
    return self;
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

@end
