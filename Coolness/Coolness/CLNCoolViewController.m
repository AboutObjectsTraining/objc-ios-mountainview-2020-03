// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (weak, nonatomic) UITextField *textField;
@property (weak, nonatomic) UIView *contentView;
@end

@implementation CLNCoolViewController

- (void)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 120, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView = contentView;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    contentView.clipsToBounds = YES;
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    
    // Controls
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 70, 240, 30)];
    self.textField = textField;
    
    textField.delegate = self;
    
    [accessoryView addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter a label";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectOffset(button.frame, 270, 70);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Cool Cells
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 240, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 240, 40)];
    
    subview1.text = @"Hello World! 🌍🌎🌏🪐";
    subview2.text = @"Cool View Cells Rock!🍾🎉";

    [contentView addSubview:subview1];
    [contentView addSubview:subview2];
    
    subview1.backgroundColor = UIColor.systemPurpleColor;
    subview2.backgroundColor = UIColor.systemOrangeColor;
}

@end
