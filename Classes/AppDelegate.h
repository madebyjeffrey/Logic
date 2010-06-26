//
//  Stellar_MastersAppDelegate.h
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright Jeffrey Drake 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SynthesizeSingleton.h"
#import "StarMapController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	StarMapController *starmap;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) 	StarMapController *starmap;

+ (AppDelegate*) sharedAppDelegate;
@end

