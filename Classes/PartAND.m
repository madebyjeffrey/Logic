//
//  PartAND.m
//  Logical
//
//  Created by Jeffrey Drake on 10-07-14.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "PartAND.h"


@implementation PartAND


+ (CGSize) partSize
{
	return CGSizeMake(3.0, 3.0);
}

+ (PartAND*) part
{
	// We don't know the size of the grid yet
	PartAND *p = [[PartAND alloc] initWithFrame: CGRectMake(128, 128, 1, 1)]; 
	
	p.gridSize = CGSizeMake(1, 1);
	
	return [p autorelease];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	//CGContextRef context = UIGraphicsGetCurrentContext();
	
	NSString *text = @"AND";
	
	UIFont *font = [UIFont fontWithName: @"Arial" size: [UIFont labelFontSize]*2];
	
	[[UIColor whiteColor] set];
	
	CGSize sz = [text sizeWithFont: font];
	
	CGRect bds = [self bounds];
	CGRect centre = { CGPointMake(bds.size.width/2 - sz.width/2 + bds.origin.x, bds.size.height/2 - sz.height/2 + bds.origin.y),
		sz};
	
	[text drawInRect: centre withFont: font];
	
}

@end
