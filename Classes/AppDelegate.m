//
//  AppDelegate.m
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright Jeffrey Drake 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "GridView.h"
#import "Components.h"

@implementation AppDelegate

@synthesize window, canvas, components;

SYNTHESIZE_SINGLETON_FOR_CLASS(AppDelegate)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	[window makeKeyAndVisible];
	
	canvas = [[GridController alloc] initWithNibName: @"Grid" bundle: nil];
//	components = [[Components alloc] initWithNibName: @"Components" bundle:nil];
	
	[window addSubview: [canvas view]];
//	[window addSubview: [components view]];
	
//	[self arrangeSubviews];

	
    return YES;
}

- (void) arrangeSubviews
{
	// Portrait Mode
	// Get Width, Height of Window
	CGRect winsize = [self.window bounds];
	
	// Get Minimum Height of Component
	int min = [self.components minHeight];
	
	// Calculate new positions
	CGRect sidebar, body;
	
	sidebar = CGRectMake(0, 0, winsize.size.width, min);
	body = CGRectMake(0, min, winsize.size.width, winsize.size.height - min);
	
	// Move Component into top spot
	components.view.frame = sidebar;
	// Move Canvas into bottom spot
	canvas.view.frame =  body;
	
//	body.origin.y = 0;
	canvas.canvas.scrollView.frame = canvas.view.bounds;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}

	


@end


