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

@interface JSFavStarControl ()

-(BOOL)isFirstStarTouched:(CGPoint)touchLocation section:(CGRect)section;

@end

@implementation JSFavStarControl

@synthesize rating = _rating;
@synthesize padding;

-(BOOL)isFirstStarTouched:(CGPoint)touchLocation section:(CGRect)section
{
    CGFloat w = (_star!=nil ) ? _star.size.width : _fontSize;
    
    return (touchLocation.x >0 && touchLocation.x < section.origin.x + w );
}

- (void)initialize
{
    _rating = 0;
    _fontSize = self.frame.size.height -2 ;
    self.padding = 15.0;
    //self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    
    
}

- (void)setRating:(NSInteger)rating
{
    if( rating != _rating ) {
        _rating = rating;
        
        [self setNeedsDisplay];
    }
}

#pragma mark - initialization

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if( self = [super initWithCoder:aDecoder] ) {
        
        [self initialize];
    }
    
    return self;
    
}

- (id)initWithFrame:(CGRect)frame 
{
    if( self = [super initWithFrame:frame] ) {
        
        [self initialize];
    }
    
    return self;
}

- (id)initWithImages:(CGRect)frame dotImage:(UIImage *)dotImage starImage:(UIImage *)starImage
{
    NSParameterAssert(dotImage);
    NSParameterAssert(starImage);
    
    
	if (self = [super initWithFrame:frame])
	{
        [self initialize];
#if __has_feature(objc_arc)
		_dot = dotImage;
		_star = starImage;
#else
		_dot = [dotImage retain];
		_star = [starImage retain];
#endif
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
			[@"★" drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:_fontSize]];
			
		currPoint.x += self.padding;
	}
	
	NSInteger remaining = RATING_MAX - _rating;
	
	for (int i = 0; i < remaining; i++)
	{
		if (_dot)
			[_dot drawAtPoint:currPoint];
		else
			[@" •" drawAtPoint:currPoint withFont:[UIFont boldSystemFontOfSize:_fontSize]];
		currPoint.x += self.padding;
	}
}


- (void)dealloc
{
#if !__has_feature(objc_arc)
    [_dot release];
	[_star release];
#endif
    
	_dot = nil,
	_star = nil;
	
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGFloat width = self.frame.size.width;
	CGRect section = CGRectMake(0, 0, width / RATING_MAX, self.frame.size.height);
	
	CGPoint touchLocation = [touch locationInView:self];
	
    if( _rating == 1 &&  [self isFirstStarTouched:touchLocation section:section]) {
        
        _rating = 0;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        
    }
    else {
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
	
    NSLog(@"endTrackingWithTouch touchLocation.x=[%f]", touchLocation.x);
    
    if( _rating == 0  &&  [self isFirstStarTouched:touchLocation section:section] ) return;

    if (touchLocation.x <= 0 )
	{
		if (_rating != 0)
		{	
			_rating = 0;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
	}
	else if (touchLocation.x > width)
	{
		if (_rating != RATING_MAX)
		{
			_rating = RATING_MAX;
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
