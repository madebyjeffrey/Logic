//
//  StarMapView.m
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "StarMapView.h"


@implementation StarMapView

@synthesize scrollView;

- (void) awakeFromNib
{
	[self setBackgroundColor: [UIColor blueColor]];
	[self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		[self setBackgroundColor: [UIColor blueColor]];
		[self setNeedsDisplay];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	UIBezierPath *p = [UIBezierPath bezierPathWithRect: CGRectMake(100, 100, 1500, 1500)];
	[[UIColor whiteColor] set];
	p.lineWidth = 5;
	
	[p stroke];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
