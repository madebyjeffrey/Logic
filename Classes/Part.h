//
//  Component.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-30.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

@interface Part : UIView {
	CGRect startingFrame;					// Helps to handle dragging operations, used in GridController
	CGSize gridSize;						// Allows us to be independant of the gridview
}

@property (nonatomic) CGRect startingFrame;
@property (nonatomic) CGSize gridSize;
@property (readonly) CGSize partSize;

- (CGSize) partSize;
- (void) adjustedFrame;
- (BOOL) handlesTouchesForView: (UIView*) view;

@end
