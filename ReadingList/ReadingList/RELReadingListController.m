// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELBookDetailController.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListController

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Book Detail"])  {
        RELBookDetailController *controller = segue.destinationViewController;
        RLMBook *selectedBook = [self.readingList bookAtIndexPath:self.tableView.indexPathForSelectedRow];
        controller.book = selectedBook;
    } else if ([segue.identifier isEqualToString:@"Add Book"]) {
        // TODO: figure out what to do here
    } else {
        NSLog(@"Unexpected segue with identifier: %@", segue.identifier);
        abort();
    }
}

// MARK: - Unwind segues
- (IBAction)done:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    [self.storeController saveReadingList:self.readingList];
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
    return cell;
}

@end
