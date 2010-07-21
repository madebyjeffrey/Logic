//
//  PartSwitch.h
//  Logical
//
//  Created by Jeffrey Drake on 10-07-14.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

#import "CustomUISwitch.h"

#import "Part.h"

@interface PartSwitch : Part {
	CustomUISwitch *switch1;
}

@property (retain, nonatomic) CustomUISwitch *switch1;

+ (PartSwitch*) part;
@end
