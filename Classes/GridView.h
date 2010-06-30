//
//  GridView.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"


@interface GridView : UIView {
	IBOutlet UIScrollView *scrollView;
	CGSize gridSize;
	CGSize mapSize;
	UIColor *gridColour;
}

@property (retain) IBOutlet UIScrollView *scrollView;
@property (assign) CGSize gridSize;
@property (assign) CGSize mapSize;
@property (retain) UIColor *backgroundColour;
@property (retain) UIColor *gridColour;

@end
