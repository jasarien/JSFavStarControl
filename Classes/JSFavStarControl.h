//
//  JSFaveStarControl.m
//  FavStarControl
//
//  Created by James "Jasarien" Addyman on 17/02/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//  http://jamsoftonline.com
//

#import <UIKit/UIKit.h>

#ifndef JF_STRONG
#if __has_feature(objc_arc)
#define JF_STRONG strong
#else
#define JF_STRONG retain
#endif
#endif

#ifndef JF_WEAK
#if __has_feature(objc_arc_weak)
#define JF_WEAK weak
#elif __has_feature(objc_arc)
#define JF_WEAK unsafe_unretained
#else
#define JF_WEAK assign
#endif
#endif

@interface JSFavStarControl : UIControl {
	
	NSInteger _rating;
	CGFloat _fontSize ;
	UIImage *_dot, *_star;
}

@property (nonatomic,assign) CGFloat padding;
@property (nonatomic,assign) NSInteger rating;

// dotImage and starImage can both be nil, or not even a dot or a star (a any images you want!)
// If either of these parameters are nil, the class will draw its own dot/star
// Use location to position the favstar control in your view - the control will manage its own width/height (kind of like UIActivityIndicator)
- (id)initWithImages:(CGRect)frame dotImage:(UIImage *)dotImage starImage:(UIImage *)starImage;

@end
