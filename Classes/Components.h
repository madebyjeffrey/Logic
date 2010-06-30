//
//  Components.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-30.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

//#import "AppDelegate.h"

@interface Components : UIViewController  {
	IBOutlet UIButton *_and;
	IBOutlet UIButton *_or;
	IBOutlet UIButton *_xor;
	IBOutlet UIButton *_not;
	IBOutlet UIButton *_about;
}

- (int) minWidth;
- (int) minHeight;

@end
