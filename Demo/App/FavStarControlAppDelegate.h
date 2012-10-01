#import <UIKit/UIKit.h>


@class FavStarControlViewController;


@interface FavStarControlAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    FavStarControlViewController *viewController;
}


/**************************************************************************************************/
#pragma mark - Getters & Setters

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet FavStarControlViewController *viewController;


@end
