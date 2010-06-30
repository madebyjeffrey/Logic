//
//  GridController.h
//  Logical
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Logical_Prefix.pch"

#import "GridView.h"

@interface GridController : UIViewController {
	GridView *starmap;
}

@property (readwrite, retain, nonatomic) IBOutlet GridView *canvas;

@end
