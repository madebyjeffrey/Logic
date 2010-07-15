//
//  Colours.m
//  Logical
//
//  Created by Jeffrey Drake on 10-07-02.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Colours.h"


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
