// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAddBookController.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELAddBookController ()
@property (readonly, nonatomic) NSDictionary *authorDictionary;
@property (readonly, nonatomic) NSDictionary *bookDictionary;
@property (readonly, nonatomic) RLMBook *book;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@end

@implementation RELAddBookController

- (NSDictionary *)authorDictionary {
    return @{
        RLMAuthorKeys.firstName : self.firstNameField.text,
        RLMAuthorKeys.lastName : self.lastNameField.text
    };
}

- (NSDictionary *)bookDictionary {
    return @{
        RLMBookKeys.title : self.titleField.text,
        RLMBookKeys.year : self.yearField.text,
        RLMBookKeys.author : self.authorDictionary
    };
}

- (RLMBook *)book {
    return [RLMBook modelObjectWithDictionary:self.bookDictionary];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Done"]) {
        self.completion(self.book);
    }
}

@end
