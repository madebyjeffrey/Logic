//
//  StarMap.h
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarMapView.h"

@interface StarMapController : UIViewController {
	StarMapView *starmap;
}

@property (readwrite, retain, nonatomic) IBOutlet StarMapView *starmap;

@end
