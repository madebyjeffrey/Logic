//
//  GridView.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"
#import "Part.h"
#import "PartAND.h"
#import "PartSwitch.h"

@interface GridView : UIView {
	IBOutlet UIScrollView *scrollView;
	CGSize gridSize;
	CGSize mapSize;
	UIColor *gridColour;
	CGSize borderPadding;
	Part *comp1;
}

@property (retain) IBOutlet UIScrollView *scrollView;
@property (assign) CGSize gridSize;
@property (assign) CGSize mapSize;
@property (assign) CGSize borderPadding;
@property (retain) UIColor *backgroundColour;
@property (retain) UIColor *gridColour;
@property (retain) Part *comp1;

- (void) centre;

@end
