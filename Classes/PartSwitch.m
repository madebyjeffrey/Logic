//
//  PartSwitch.m
//  Logical
//
//  Created by Jeffrey Drake on 10-07-14.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "PartSwitch.h"


@implementation PartSwitch

@synthesize switch1;

- (CGSize) partSize
{
	return CGSizeMake(3.0, 3.0);
}

+ (PartSwitch*) part
{
	// We don't know the size of the grid yet
	PartSwitch *p = [[PartSwitch alloc] initWithFrame: CGRectMake(128, 128, 1, 1)]; 
					
	p.gridSize = CGSizeMake(1, 1);
	
	return [p autorelease];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		switch1 = [[UISwitch alloc] initWithFrame: CGRectMake(1, 1, 0, 0)]; // ignores size
		switch1.center = CGPointMake([self bounds].size.width / 2 + [self bounds].origin.x,
									 [self bounds].size.height / 2 + [self bounds].origin.y);
		
		[self addSubview: switch1];
	}
	
	return self;
}

- (BOOL) handlesTouchesForView: (UIView*) view
{
	if (view == switch1)
		return YES;
	return NO;
}
- (void) adjustedFrame
{
	switch1.center = CGPointMake([self bounds].size.width / 2 + [self bounds].origin.x,
								 [self bounds].size.height / 2 + [self bounds].origin.y);

}

/*- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	if (view == switch1)
	{
		return NO;
	}
	else return [super touchesShouldBegin: touches withEvent: event inContentView: view];
}*/
@end
