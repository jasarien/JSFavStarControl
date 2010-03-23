//
//  FavStarControlAppDelegate.h
//  FavStarControl
//
//  Created by james on 17/02/2010.
//  Copyright Truphone 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FavStarControlViewController;

@interface FavStarControlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FavStarControlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FavStarControlViewController *viewController;

@end

