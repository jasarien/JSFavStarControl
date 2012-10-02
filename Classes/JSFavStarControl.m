//
//  JSFaveStarControl.m
//  FavStarControl
//
//  Created by James "Jasarien" Addyman on 17/02/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//  http://jamsoftonline.com
//

#import "JSFavStarControl.h"


// Constants :
static const CGFloat kFontSize = 20;
static const NSInteger kStarWidthAndHeight = 20;

static const NSString *kDefaultEmptyChar = @"☆";
static const NSString *kDefaultSolidChar = @"★";


@interface JSFavStarControl (Private)

- (void)handleTouch:(UITouch *)touch;

@end


@implementation JSFavStarControl


/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize rating = _rating;
- (void)setRating:(NSInteger)rating
{
    _rating = (rating < 0) ? 0 : rating;
    _rating = (rating > _maxRating) ? _maxRating : rating;
    [self setNeedsDisplay];
}


/**************************************************************************************************/
#pragma mark - Birth & Death

- (id)initWithLocation:(CGPoint)location
            emptyImage:(UIImage *)emptyImage
            solidImage:(UIImage *)solidImage
          andMaxRating:(NSInteger)maxRating
{
	if (self = [self initWithFrame:CGRectMake(location.x,
                                              location.y,
                                              (maxRating * kStarWidthAndHeight),
                                              kStarWidthAndHeight)])
	{
		_rating = 0;
		self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		
		_emptyImage = emptyImage;
		_solidImage = solidImage;
        _maxRating = maxRating;
	}
	
	return self;
}

- (void)dealloc
{
	_emptyImage = nil,
	_solidImage = nil;
}


/**************************************************************************************************/
#pragma mark - View Lifecycle

- (void)drawRect:(CGRect)rect
{
	CGPoint currPoint = CGPointZero;
	
	for (int i = 0; i < _rating; i++)
	{
		if (_solidImage)
        {
            [_solidImage drawAtPoint:currPoint];
        }
		else
        {
            [kDefaultSolidChar drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:kFontSize]];
        }
			
		currPoint.x += kStarWidthAndHeight;
	}
	
	NSInteger remaining = _maxRating - _rating;
	
	for (int i = 0; i < remaining; i++)
	{
		if (_emptyImage)
        {
			[_emptyImage drawAtPoint:currPoint];
        }
		else
        {
			[kDefaultEmptyChar drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:kFontSize]];
        }
		currPoint.x += kStarWidthAndHeight;
	}
}


/**************************************************************************************************/
#pragma mark - UIControl

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self handleTouch:touch];
	return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self handleTouch:touch];
	return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
}


/**************************************************************************************************/
#pragma mark - Private Methods

- (void)handleTouch:(UITouch *)touch
{
    CGFloat width = self.frame.size.width;
	CGRect section = CGRectMake(0, 0, (width / _maxRating), self.frame.size.height);
	
	CGPoint touchLocation = [touch locationInView:self];
	
	if (touchLocation.x < 0)
	{
		if (_rating != 0)
		{
			_rating = 0;
			[self sendActionsForControlEvents:UIControlEventEditingChanged];
		}
	}
	else if (touchLocation.x > width)
	{
		if (_rating != _maxRating)
		{
			_rating = _maxRating;
			[self sendActionsForControlEvents:UIControlEventEditingChanged];
		}
	}
	else
	{
		for (int i = 0 ; i < _maxRating ; i++)
		{
			if ((touchLocation.x > section.origin.x) && (touchLocation.x < (section.origin.x + section.size.width)))
			{
				if (_rating != (i+1))
				{
					_rating = i+1;
					[self sendActionsForControlEvents:UIControlEventEditingChanged];
				}
				break;
			}
			section.origin.x += section.size.width;
		}
	}
	[self setNeedsDisplay];
}

@end
