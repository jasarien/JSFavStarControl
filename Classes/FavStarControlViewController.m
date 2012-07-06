#import "FavStarControlViewController.h"
#import "JSFavStarControl.h"

@implementation FavStarControlViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIImage *dot, *star;
	dot = [UIImage imageNamed:@"dot10x10.png"];
	star = [UIImage imageNamed:@"star10x10.png"];
	JSFavStarControl *rating = [[JSFavStarControl alloc] initWithImages:CGRectMake(110, 220, 100, 20) 
                                                                 dotImage:dot 
                                                                starImage:star];
    rating.rating = 1;
    
	[rating addTarget:self action:@selector(updateRating:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:rating];
    
#if !__has_feature(objc_arc)    
	[rating release];
#endif
}

- (void)updateRating:(id)sender
{
	NSLog(@"Rating: %d", [(JSFavStarControl *)sender rating]);
	[label setText:[NSString stringWithFormat:@"%d", [(JSFavStarControl *)sender rating]]];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

@end
