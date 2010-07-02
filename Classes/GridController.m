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
@synthesize canvas;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
//	CGRect r = [[[AppDelegate sharedAppDelegate] window] bounds];
	CGRect canvas_size = CGRectMake(0, 0, 1600, 2200);
	
	CGPoint screen = {[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height};

	self.canvas.frame = canvas_size;
	
	self.canvas.scrollView.contentSize = canvas_size.size;
	self.canvas.scrollView.contentOffset = CGPointMake(canvas_size.size.width/2-screen.x/2, 
													   canvas_size.size.height/2-screen.y/2);


	
	
	[self.canvas setNeedsDisplay];
	
	self.canvas.mapSize = CGSizeMake(canvas_size.size.width/self.canvas.gridSize.width, 
									 canvas_size.size.height/self.canvas.gridSize.height);

	
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	NSLog(@"contentOffset: { %f, %f }", self.canvas.scrollView.contentOffset.x, self.canvas.scrollView.contentOffset.y);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
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
