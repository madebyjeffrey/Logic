//
//  StarMapView.h
//  Stellar Masters
//
//  Created by Jeffrey Drake on 10-06-15.
//  Copyright 2010 Jeffrey Drake. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StarMapView : UIView {
	IBOutlet UIScrollView *scrollView;
}

@property (retain) IBOutlet UIScrollView *scrollView;

@end
