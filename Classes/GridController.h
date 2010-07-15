//
//  GridController.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

#import "GridView.h"
#import "Part.h"

@interface GridController : UIViewController <UIGestureRecognizerDelegate> {
	GridView *starmap;
	UITapGestureRecognizer *tapGesture;
	UIPanGestureRecognizer *panGesture;
}

@property (readwrite, retain, nonatomic) IBOutlet GridView *canvas;
@property (retain, nonatomic) UITapGestureRecognizer *tapGesture;
@property (retain, nonatomic) UIPanGestureRecognizer *panGesture;
@end
