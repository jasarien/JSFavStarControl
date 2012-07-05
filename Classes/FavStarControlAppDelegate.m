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
#if !__has_feature(objc_arc)
    [viewController release];
    [window release];
    [super dealloc];
#endif    
}


@end
