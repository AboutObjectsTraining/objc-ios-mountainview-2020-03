// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELBookDetailController.h"
#import "RELAddBookController.h"
#import "UIStoryboardSegue+RELAdditions.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.window.tintColor = [UIColor colorNamed:@"Tint Color"];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Book Detail"])  {
        RELBookDetailController *controller = segue.rel_destinationViewController;
        RLMBook *selectedBook = [self.readingList bookAtIndexPath:self.tableView.indexPathForSelectedRow];
        controller.book = selectedBook;
    } else if ([segue.identifier isEqualToString:@"Add Book"]) {
        RELAddBookController *controller = segue.rel_destinationViewController;
        controller.completion = ^(RLMBook *book) {
            [self.readingList insertBook:book atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        };
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

- (IBAction)cancel:(UIStoryboardSegue *)sender {
    // Does nothing (by design)
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.readingList removeBookAtIndexPath:indexPath];
    [self.storeController saveReadingList:self.readingList];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.readingList moveBookAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [self.storeController saveReadingList:self.readingList];
}

@end
