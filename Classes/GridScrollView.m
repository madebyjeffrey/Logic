//
//  GridScrollView.m
//  Logical
//
//  Created by Jeffrey Drake on 10-07-05.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "GridScrollView.h"

#import "Part.h"

@implementation GridScrollView
/*
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	if ([view isKindOfClass: @class(Component)] == YES)
		return YES;
	else return NO;
} */

/* Allows the touch to go down to the control */

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
	if ([view isKindOfClass: [Part class]] == NO)
		return YES;
	else return NO;
}

@end
