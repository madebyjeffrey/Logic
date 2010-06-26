    //
//  StarMap.m
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "StarMapController.h"
#import "AppDelegate.h"


@implementation StarMapController
@synthesize starmap;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
//	CGRect r = [[[AppDelegate sharedAppDelegate] window] bounds];
	CGRect starsize = CGRectMake(0, 0, 2048, 2048);
	
	self.starmap.scrollView.contentSize = starsize.size;
	self.starmap.frame = starsize;
	
	[self.starmap setNeedsDisplay];
	
	self.starmap.mapSize = CGSizeMake(12, 12);
	
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
