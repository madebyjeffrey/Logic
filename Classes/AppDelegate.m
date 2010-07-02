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
	components = [[Components alloc] initWithNibName: @"Components" bundle:nil];
	
	[window addSubview: [canvas view]];
	[window addSubview: [components view]];
	
	[self arrangeSubviews];

	
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
	canvas.view.frame = body;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}

	


@end

@implementation UIColor(Custom)

+ (UIColor*) prussianBlue
{
	return [UIColor colorWithHue: 205/360.0 saturation: 1.0 brightness: 0.43 alpha: 1.0];
}

+ (UIColor*) egyptianBlue
{
	return [UIColor colorWithHue: 244/360.0 saturation: 0.77 brightness: 0.42 alpha: 1.0];
}

+ (UIColor*) malachite
{
	return [UIColor colorWithHue: 99/360.0 saturation: 0.37 brightness: 0.62 alpha: 1.0];
}
@end

