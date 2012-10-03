#import <UIKit/UIKit.h>


@class AMRatingControlViewController;


@interface AMRatingControlAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    AMRatingControlViewController *viewController;
}


/**************************************************************************************************/
#pragma mark - Getters & Setters

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet AMRatingControlViewController *viewController;


@end
