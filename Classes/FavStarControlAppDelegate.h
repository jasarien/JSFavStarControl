#import <UIKit/UIKit.h>

@class FavStarControlViewController;

@interface FavStarControlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FavStarControlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FavStarControlViewController *viewController;

@end

