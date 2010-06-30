//
//  AppDelegate.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright Jeffrey Drake 2010. All rights reserved.
//

#import "Logical_Prefix.pch"

#import "SynthesizeSingleton.h"
#import "GridController.h"
#import "Components.h"
/*
@protocol Sidebar

- (int) minWidth;
- (int) minHeight;

@end
*/

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	GridController *canvas;
	Components *components;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) GridController *canvas;
@property (nonatomic, retain) Components *components;

+ (AppDelegate*) sharedAppDelegate;
- (void) arrangeSubviews;
@end

