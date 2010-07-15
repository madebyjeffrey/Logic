//
//  PartSwitch.h
//  Logical
//
//  Created by Jeffrey Drake on 10-07-14.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

#import "Part.h"

@interface PartSwitch : Part {
	UISwitch *switch1;
}

@property (retain, nonatomic) UISwitch *switch1;

+ (PartSwitch*) part;
@end
