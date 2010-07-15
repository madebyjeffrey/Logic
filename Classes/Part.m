//
//  Component.m
//  Logical
//
//  Created by Jeffrey Drake on 10-06-30.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Part.h"
#import "GridView.h" // has some necessary constants, too tightly bound?

@implementation Part

@synthesize startingFrame;
@dynamic gridSize, partSize;

+ (void) load
{
	NSLog(@"Part initialized");
}

- (CGSize) gridSize
{
	return gridSize;
}

- (void) setGridSize:(CGSize)gs
{
	gridSize = gs;
	CGRect f = self.frame;
	f.size = CGSizeMake(self.partSize.width * self.gridSize.width - 1, 
								 self.partSize.height * self.gridSize.height - 1);
	self.frame = f;
	[self adjustedFrame];
}

- (CGSize) partSize
{
	return CGSizeMake(3.0, 3.0);
}

+ (Part*) part
{
	return nil; // Can't instantiate base class
	
	/*Part *p = [[Part alloc] initWithFrame: CGRectMake(128, 128, 
							  [Part partSize].width * [view gridSize].width - 1, 
							  [Part partSize].height * [view gridSize].height - 1)];
	
	[view addSubview: p];
	
	return [p autorelease]; */
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.layer.opacity = 1.0;
		self.layer.opaque = YES;
		self.layer.backgroundColor = [UIColor blackColor].CGColor;
		self.layer.cornerRadius = 0;
		self.layer.borderColor = [UIColor orangeColor].CGColor;
		self.layer.borderWidth = 5;
		self.layer.shadowColor = [UIColor redColor].CGColor;
		self.layer.shadowOffset = CGSizeMake(0, 0);
		self.layer.shadowOpacity = 0.5;
		self.layer.shadowRadius = 64;
    }
    return self;
}

- (BOOL) handlesTouchesForView: (UIView*) view
{
	return NO;
}

- (void) adjustedFrame
{
	
}
/*
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	if (view == self)
	{
		return YES;
	}
	else { return NO; }
} */

- (void)dealloc {
    [super dealloc];
}


@end
