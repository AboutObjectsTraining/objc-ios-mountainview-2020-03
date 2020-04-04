// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELSceneDelegate.h"
#import "UIColor+RELAppearance.h"

@interface RELSceneDelegate ()

@end

@implementation RELSceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    
    self.window.tintColor = UIColor.tintColor;
    
    UINavigationBar *navBarAppearanceProxy = UINavigationBar.appearance;
    navBarAppearanceProxy.largeTitleTextAttributes = @{ NSForegroundColorAttributeName : UIColor.tintColor};
    navBarAppearanceProxy.titleTextAttributes = @{ NSForegroundColorAttributeName : UIColor.tintColor};
    
    UITableViewCell *cellAppearanceProxy = UITableViewCell.appearance;
    cellAppearanceProxy.backgroundColor = UIColor.cellColor;
}

@end
