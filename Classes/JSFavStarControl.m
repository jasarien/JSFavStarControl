//
//  JSFaveStarControl.m
//  FavStarControl
//
//  Created by James "Jasarien" Addyman on 17/02/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//  http://jamsoftonline.com
//

#import "JSFavStarControl.h"

#define RATING_MAX 5

@implementation JSFavStarControl

@synthesize rating = _rating;

- (id)initWithLocation:(CGPoint)location dotImage:(UIImage *)dotImage starImage:(UIImage *)starImage
{
	if (self = [self initWithFrame:CGRectMake(location.x, location.y, 100, 20)])
	{
		_rating = 0;
		self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		
		_dot = dotImage;
		_star = starImage;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect
{
	CGPoint currPoint = CGPointZero;
	
	for (int i = 0; i < _rating; i++)
	{
		if (_star)
			[_star drawAtPoint:currPoint];
		else
			[@"★" drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:22]];
			
		currPoint.x += 20;
	}
	
	NSInteger remaining = RATING_MAX - _rating;
	
	for (int i = 0; i < remaining; i++)
	{
		if (_dot)
			[_dot drawAtPoint:currPoint];
		else
			[@" •" drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:22]];
		currPoint.x += 20;
	}
}


- (void)dealloc
{
	
	_dot = nil,
	_star = nil;
	
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGFloat width = self.frame.size.width;
	CGRect section = CGRectMake(0, 0, width / RATING_MAX, self.frame.size.height);
	
	CGPoint touchLocation = [touch locationInView:self];
	
	for (int i = 0; i < RATING_MAX; i++)
	{		
		if (touchLocation.x > section.origin.x && touchLocation.x < section.origin.x + section.size.width)
		{ // touch is inside section
			if (_rating != (i+1))
			{
				_rating = i+1;
				[self sendActionsForControlEvents:UIControlEventValueChanged];
			}
			
			break;
		}
		
		section.origin.x += section.size.width;
	}
	
	[self setNeedsDisplay];
	return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGFloat width = self.frame.size.width;
	CGRect section = CGRectMake(0, 0, width / RATING_MAX, self.frame.size.height);
	
	CGPoint touchLocation = [touch locationInView:self];
	
	if (touchLocation.x < 0)
	{
		if (_rating != 0)
		{	
			_rating = 0;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
	}
	else if (touchLocation.x > width)
	{
		if (_rating != 5)
		{
			_rating = 5;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
	}
	else
	{
		for (int i = 0; i < RATING_MAX; i++)
		{
			if (touchLocation.x > section.origin.x && touchLocation.x < section.origin.x + section.size.width)
			{ // touch is inside section
				if (_rating != (i+1))
				{
					_rating = i+1;
					[self sendActionsForControlEvents:UIControlEventValueChanged];
				}
				break;
			}
			
			section.origin.x += section.size.width;
		}
	}
	
	[self setNeedsDisplay];
	return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGFloat width = self.frame.size.width;
	CGRect section = CGRectMake(0, 0, width / RATING_MAX, self.frame.size.height);
	
	CGPoint touchLocation = [touch locationInView:self];
	
	if (touchLocation.x < 0)
	{
		if (_rating != 0)
		{	
			_rating = 0;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
	}
	else if (touchLocation.x > width)
	{
		if (_rating != 5)
		{
			_rating = 5;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
		
	}
	else
	{
		for (int i = 0; i < RATING_MAX; i++)
		{
			if (touchLocation.x > section.origin.x && touchLocation.x < section.origin.x + section.size.width)
			{
				if (_rating != (i+1))
				{
					_rating = i+1;
					[self sendActionsForControlEvents:UIControlEventValueChanged];
				}
				
				break;
			}
			
			section.origin.x += section.size.width;
		}
	}
	
	[self setNeedsDisplay];
}

@end
