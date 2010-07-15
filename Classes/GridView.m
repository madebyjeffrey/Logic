//
//  GridView.m
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "GridView.h"



@implementation GridView

@synthesize scrollView, gridSize, gridColour, borderPadding, comp1;

@dynamic mapSize, backgroundColour;

- (void) awakeFromNib
{
	self.backgroundColour = [UIColor prussianBlue]; 
	self.gridColour = [UIColor colorWithHue: 234/360.0 saturation: 0.12 brightness:1.0 alpha:1.0];
	
	[self setNeedsDisplay];
	self.gridSize = CGSizeMake(40, 40);
	self.borderPadding = CGSizeMake(32, 32);
	
	self.comp1 = [PartSwitch part];
	self.comp1.gridSize = self.gridSize;
	
	[self addSubview: comp1];
	
	self.exclusiveTouch = YES;
}



- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	if (view == comp1)
	{
		return YES;
	}
	else { return NO; }
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
	
	// Minimum size = 8 * 8
	if (sz.width < 32) sz.width = 32;
	if (sz.height < 32) sz.height = 32;
	
	CGSize newSize = {sz.width * gridSize.width + 64, sz.height * gridSize.height + 64};
	CGRect newFrame;
	
	newFrame.origin = CGPointMake(0, 0);
	newFrame.size = newSize;
	
	self.scrollView.contentSize = newSize;
	self.frame = newFrame;
	mapSize = sz;
	
}

- (void) centre
{
	CGPoint screen = {[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height};
	
	CGSize canvas_size = self.scrollView.contentSize;
	

//	self.canvas.scrollView.contentSize = canvas_size.size;
	self.scrollView.contentOffset = CGPointMake(canvas_size.width/2-screen.x/2, 
													   canvas_size.height/2-screen.y/2);	
}

- (CGSize) mapSize
{
	return mapSize;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

	CGSize sz = self.bounds.size;
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetAllowsAntialiasing(context, NO); 
	CGContextSetShouldAntialias(context, NO); 
	
	
	// définir la couleur du crayon
	CGContextSetStrokeColorWithColor(context, self.gridColour.CGColor);
	
	// définir la largeur de plume
	CGContextSetLineWidth(context, 1);
	
	// Draw outside border
	CGRect bordure = CGRectMake(borderPadding.width, 
								borderPadding.height, 
								self.frame.size.width - borderPadding.width*2, 
								self.frame.size.height - borderPadding.height*2);
	CGContextAddRect(context, bordure);

	CGContextStrokePath(context);

	// Draw inside
	CGContextSetStrokeColorWithColor(context, self.gridColour.CGColor);

	CGContextSetLineWidth(context, 0.5);
	for (int y = borderPadding.height; y < sz.height - borderPadding.height; y+=self.gridSize.height)
	{
		CGContextMoveToPoint(context, borderPadding.width, y);
		CGContextAddLineToPoint(context, sz.width-borderPadding.width, y);
	}
	
	for (int x = borderPadding.width; x < sz.width - borderPadding.width; x+=self.gridSize.width)
	{
		CGContextMoveToPoint(context, x, borderPadding.height);
		CGContextAddLineToPoint(context, x, sz.height-borderPadding.height);
	}
	
	CGContextStrokePath(context);
	
}


- (void)dealloc {
    [super dealloc];
}


@end
