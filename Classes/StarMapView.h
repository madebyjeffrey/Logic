//
//  StarMapView.h
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import "Stellar_Masters_Prefix.pch"


@interface StarMapView : UIView {
	IBOutlet UIScrollView *scrollView;
	CGSize gridSize;
	CGSize mapSize;
}

@property (retain) IBOutlet UIScrollView *scrollView;
@property (assign) CGSize gridSize;
@property (assign) CGSize mapSize;
@end
