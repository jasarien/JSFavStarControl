#import "FavStarControlViewController.h"
#import "JSFavStarControl.h"


@interface FavStarControlViewController (Private)

- (void)updateRating:(id)sender;
- (void)updateEndRating:(id)sender;

@end


@implementation FavStarControlViewController


/**************************************************************************************************/
#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIImage *dot, *star;
	dot = [UIImage imageNamed:@"dot.png"];
	star = [UIImage imageNamed:@"star.png"];
	JSFavStarControl *rating = [[JSFavStarControl alloc] initWithLocation:CGPointMake(110, 220)
                                                               emptyImage:dot
                                                               solidImage:star
                                                             andMaxRating:6];
	[rating addTarget:self action:@selector(updateRating:) forControlEvents:UIControlEventEditingChanged];
    [rating addTarget:self action:@selector(updateEndRating:) forControlEvents:UIControlEventEditingDidEnd];
	[self.view addSubview:rating];
}


/**************************************************************************************************/
#pragma mark - Private Methods

- (void)updateRating:(id)sender
{
	NSLog(@"Rating: %d", [(JSFavStarControl *)sender rating]);
	[label setText:[NSString stringWithFormat:@"%d", [(JSFavStarControl *)sender rating]]];
}

- (void)updateEndRating:(id)sender
{
    NSLog(@"End Rating: %d", [(JSFavStarControl *)sender rating]);
	[endLabel setText:[NSString stringWithFormat:@"%d", [(JSFavStarControl *)sender rating]]];
}


@end
