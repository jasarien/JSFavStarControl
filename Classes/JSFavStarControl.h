//
//  JSFaveStarControl.m
//  FavStarControl
//
//  Created by James "Jasarien" Addyman on 17/02/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//  http://jamsoftonline.com
//

#import <UIKit/UIKit.h>


@interface JSFavStarControl : UIControl
{
	UIImage *_emptyImage, *_solidImage;
}


/**************************************************************************************************/
#pragma mark - Getters and Setters

@property (nonatomic, assign) NSInteger rating;


/**************************************************************************************************/
#pragma mark - Birth & Death

/** 
 * @param location : position of the favstar control in your view
 * The control will manage its own width/height (kind of like UIActivityIndicator)
 * @param emptyImage & solidImage can both be nil, or not even a dot or a star (a any images you want!)
 * If either of these parameters are nil, the class will draw its own stars
 */
- (id)initWithLocation:(CGPoint)location
            emptyImage:(UIImage *)emptyImage
            solidImage:(UIImage *)solidImage;

@end
