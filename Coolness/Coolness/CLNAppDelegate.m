// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAppDelegate.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = UIColor.systemYellowColor;
    
    self.window.rootViewController = [[CLNCoolViewController alloc] init];
    
    [self.window makeKeyAndVisible];
}

@end
