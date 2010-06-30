//
//  GridView.m
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "GridView.h"



@implementation GridView

@synthesize scrollView, gridSize, gridColour;

@dynamic mapSize, backgroundColour;

- (void) awakeFromNib
{
	self.backgroundColour = [UIColor colorWithRed: 208/255.0f 
											green: 208/255.0f 
											 blue: 208/255.0f 
											alpha: 1.0f];
	self.gridColour = [UIColor colorWithRed: 187/255.0f
									  green: 187/255.0f 
									   blue: 187/255.0f 
									  alpha: 1.0f];
	
	[self setNeedsDisplay];
	self.gridSize = CGSizeMake(32, 32);
}

- (UIColor*) backgroundColour
{
	return self.backgroundColor;
}

- (void) setBackgroundColour:(UIColor *)c
{
	self.backgroundColor = c;
}

- (void) setMapSize:(CGSize) sz
{
	CGSize newSize = {sz.width * gridSize.width, sz.height * gridSize.height};
	CGRect newFrame;
	
	newFrame.origin = CGPointMake(0, 0);
	newFrame.size = newSize;
	
	self.scrollView.contentSize = newSize;
	self.frame = newFrame;
	mapSize = sz;
	
}

- (CGSize) mapSize
{
	return mapSize;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//	UIBezierPath *p = [UIBezierPath bezierPathWithRect: CGRectMake(100, 100, 1500, 1500)];
//	[[UIColor whiteColor] set];
//	p.lineWidth = 5;
	
//	[p stroke];
	CGSize sz = self.bounds.size;
	CGContextRef context = UIGraphicsGetCurrentContext();

	
	// définir la couleur du crayon
	CGContextSetStrokeColorWithColor(context, self.gridColour.CGColor);
	
	// définir la largeur de plume
	CGContextSetLineWidth(context, 2.0);
	
	for (int y = 0; y < sz.height; y+=gridSize.height)
	{
		CGContextMoveToPoint(context, 0, y);
		CGContextAddLineToPoint(context, sz.width, y);
	}
	
	for (int x = 0; x < sz.width; x+=gridSize.width)
	{
		CGContextMoveToPoint(context, x, 0);
		CGContextAddLineToPoint(context, x, sz.height);
	}
	
	CGContextStrokePath(context);
	
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
