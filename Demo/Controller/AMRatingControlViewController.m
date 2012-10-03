#import "AMRatingControlViewController.h"
#import "AMRatingControl.h"


@interface AMRatingControlViewController (Private)

- (void)updateRating:(id)sender;
- (void)updateEndRating:(id)sender;

@end


@implementation AMRatingControlViewController


/**************************************************************************************************/
#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Create an instance, initing with :
    // - a CGPoint (the position in your view from which it will be drawn)
    // - a custom empty image and solid image if you wish (pass nil if you want to use the default).
    // - and max rating
	UIImage *dot, *star;
	dot = [UIImage imageNamed:@"dot.png"];
	star = [UIImage imageNamed:@"star.png"];
	AMRatingControl *ratingControl = [[AMRatingControl alloc] initWithLocation:CGPointMake(110, 220)
                                                                      emptyImage:dot
                                                                      solidImage:star
                                                                    andMaxRating:5];
    
    // Customize the current rating if needed
    [ratingControl setRating:3];
    
    // Listen to control events
	[ratingControl addTarget:self action:@selector(updateRating:) forControlEvents:UIControlEventEditingChanged];
    [ratingControl addTarget:self action:@selector(updateEndRating:) forControlEvents:UIControlEventEditingDidEnd];
    
    // Add the control as a subview of your view
	[self.view addSubview:ratingControl];
}


/**************************************************************************************************/
#pragma mark - Private Methods

- (void)updateRating:(id)sender
{
	NSLog(@"Rating: %d", [(AMRatingControl *)sender rating]);
	[label setText:[NSString stringWithFormat:@"%d", [(AMRatingControl *)sender rating]]];
}

- (void)updateEndRating:(id)sender
{
    NSLog(@"End Rating: %d", [(AMRatingControl *)sender rating]);
	[endLabel setText:[NSString stringWithFormat:@"%d", [(AMRatingControl *)sender rating]]];
}


@end
