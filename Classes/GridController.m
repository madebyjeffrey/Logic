//
//  GridController.m
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "GridController.h"
#import "AppDelegate.h"


@implementation GridController
@synthesize canvas, tapGesture, panGesture;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	

	self.canvas.mapSize = CGSizeMake(20, 25);
	[self.canvas centre];

	self.canvas.scrollView.delaysContentTouches = NO;
	
	tapGesture = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(tapCanvas:)];
	tapGesture.delegate	= self;
	tapGesture.numberOfTapsRequired = 1;
	tapGesture.numberOfTouchesRequired = 1;
	tapGesture.cancelsTouchesInView = NO;
	[self.canvas addGestureRecognizer: self.tapGesture];
	
	panGesture = [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(dragComponent:)];
	panGesture.delegate = self;
	panGesture.maximumNumberOfTouches = 1;
	panGesture.minimumNumberOfTouches = 1;
	panGesture.cancelsTouchesInView = NO;
	
	[self.canvas.comp1 addGestureRecognizer: panGesture];
	
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
	return ([self.canvas.comp1 handlesTouchesForView: [touch view]]) != YES;
}

- (void) tapCanvas: (UITapGestureRecognizer *)tapper
{
	
	NSLog(@"Tapped");
}

- (void) dragComponent: (UIPanGestureRecognizer*)sender
{
	NSLog(@"Drag");
	
	if (sender.state == UIGestureRecognizerStateBegan)
	{
		self.canvas.comp1.startingFrame = self.canvas.comp1.frame;
	}
	
	CGPoint translate;
	
	translate = [sender translationInView: self.canvas];
	
	CGRect newFrame = self.canvas.comp1.startingFrame;
	newFrame.origin.x += translate.x;
	newFrame.origin.y += translate.y;
	
	
	sender.view.frame = newFrame;
	
	if (sender.state == UIGestureRecognizerStateEnded)
	{
		CGPoint topleft = newFrame.origin;
		
		topleft.x -= self.canvas.borderPadding.width;
		topleft.y -= self.canvas.borderPadding.height;
		
		topleft.x -= fmod(topleft.x, self.canvas.gridSize.width);
		topleft.y -= fmod(topleft.y, self.canvas.gridSize.height);
		
		topleft.x += self.canvas.borderPadding.width;
		topleft.y += self.canvas.borderPadding.height;
		
		CGPoint centre = topleft;
		centre.x += self.canvas.comp1.frame.size.width/2 + 1;
		centre.y += self.canvas.comp1.frame.size.height/2;
		
		[UIView beginAnimations: @"SnapComponent" context: nil];
		
		self.canvas.comp1.center = centre;
		
		[UIView commitAnimations];		
		
	}
		
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//	NSLog(@"contentOffset: { %f, %f }", self.canvas.scrollView.contentOffset.x, self.canvas.scrollView.contentOffset.y);
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
