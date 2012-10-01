#import "FavStarControlAppDelegate.h"
#import "FavStarControlViewController.h"


@implementation FavStarControlAppDelegate


/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize window;
@synthesize viewController;


/**************************************************************************************************/
#pragma mark - Application Lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


@end
