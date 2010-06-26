//
//  Stellar_MastersAppDelegate.m
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright Jeffrey Drake 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "StarMapView.h"

@implementation AppDelegate

@synthesize window, starmap;

SYNTHESIZE_SINGLETON_FOR_CLASS(AppDelegate)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	[window makeKeyAndVisible];
	
	starmap = [[StarMapController alloc] initWithNibName: @"StarMap" bundle: nil];
	[window addSubview: [starmap view]];
	

	
    return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
