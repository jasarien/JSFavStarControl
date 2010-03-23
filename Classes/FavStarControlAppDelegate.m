//
//  FavStarControlAppDelegate.m
//  FavStarControl
//
//  Created by james on 17/02/2010.
//  Copyright Truphone 2010. All rights reserved.
//

#import "FavStarControlAppDelegate.h"
#import "FavStarControlViewController.h"

@implementation FavStarControlAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
