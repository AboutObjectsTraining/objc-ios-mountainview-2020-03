// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAppDelegate.h"

@interface RELAppDelegate ()

@end

@implementation RELAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    // FIXME: Where do we get ahold of the main window now?
//    UIApplication.sharedApplication.keyWindow.tintColor = [UIColor colorNamed:@"Tint Color"];
}


#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options
{
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

@end
