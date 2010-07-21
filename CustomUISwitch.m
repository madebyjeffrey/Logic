//
//  CustomUISwitch.m
//
//  Created by Duane Homick
//  Homick Enterprises - www.homick.com
//

#import "CustomUISwitch.h"

#define SWITCH_DISPLAY_WIDTH		94.0
#define SWITCH_WIDTH				149.0
#define SWITCH_HEIGHT				27.0

#define RECT_FOR_OFF		CGRectMake(-55.0, 0.0, SWITCH_WIDTH, SWITCH_HEIGHT)
#define RECT_FOR_ON			CGRectMake(0.0, 0.0, SWITCH_WIDTH, SWITCH_HEIGHT)
#define RECT_FOR_HALFWAY	CGRectMake(-27.5, 0.0, SWITCH_WIDTH, SWITCH_HEIGHT)

@interface CustomUISwitch ()
@property (nonatomic, retain, readwrite) UIImageView* backgroundImage;
@property (nonatomic, retain, readwrite) UIImageView* switchImage;
- (void)setupUserInterface;
- (void)toggle;
- (void)animateSwitch:(BOOL)toOn;
@end


@implementation CustomUISwitch
@synthesize backgroundImage = _backgroundImage;
@synthesize switchImage = _switchImage;
@synthesize delegate = _delegate;

@synthesize switchForeground, switchON, switchOFF;

/**
 * Destructor
 */
- (void)dealloc
{
	[_backgroundImage release];
	[_switchImage release];
	[super dealloc];
}

/** 
 * Constructor
 */
- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, SWITCH_DISPLAY_WIDTH, SWITCH_HEIGHT)]) 
	{
		_on = YES;
		_hitCount = 0;

		self.backgroundColor = [UIColor clearColor];
		self.clipsToBounds = YES;
		self.autoresizesSubviews = NO;
		self.autoresizingMask = 0;
		self.opaque = YES;
		
		self.switchON = @"NO_ON.png";
		self.switchOFF = @"NO_OFF.png";
		self.switchForeground = @"NO_SWITCH.png";
		
		[self setupUserInterface];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame imagePrefix: (NSString*)prefix
{
	if (self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, SWITCH_DISPLAY_WIDTH, SWITCH_HEIGHT)]) 
	{
		_on = YES;
		_hitCount = 0;
		
		self.backgroundColor = [UIColor clearColor];
		self.clipsToBounds = YES;
		self.autoresizesSubviews = NO;
		self.autoresizingMask = 0;
		self.opaque = YES;
		
		self.switchON = [prefix stringByAppendingString: @"_ON.png"];
		self.switchOFF = [prefix stringByAppendingString: @"_OFF.png"];
		self.switchForeground = [prefix stringByAppendingString: @"_SWITCH.png"];
		
		[self setupUserInterface];
    }
    return self;
	
}

/**
 * Setup the user interface
 */
- (void)setupUserInterface
{
	// Background image
	UIImageView* bg = [[UIImageView alloc] initWithFrame:RECT_FOR_ON];
	bg.image = [UIImage imageNamed: self.switchON]; //@"NO_ON.png"];
	bg.backgroundColor = [UIColor clearColor];
	bg.contentMode = UIViewContentModeLeft;
	self.backgroundImage = bg;
	[bg release];
	
	// Switch image
	UIImageView* foreground = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SWITCH_WIDTH, SWITCH_HEIGHT)];
	foreground.image = [UIImage imageNamed: self.switchForeground]; //@"NO_SWITCH.png"];
	foreground.contentMode = UIViewContentModeLeft;
	self.switchImage = foreground;
	[foreground release];

	// Check for user input
	[self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	[self addSubview:self.backgroundImage];
	[self.backgroundImage addSubview:self.switchImage];
}

/**
 * Drawing Code
 */
- (void)drawRect:(CGRect)rect 
{
	// nothing
}

/**
 * Configure it into a certain state
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated
{
	if (_on)
	{
		self.switchImage.frame = RECT_FOR_ON;
		self.backgroundImage.image = [UIImage imageNamed: self.switchON];
	}
	else
	{
		self.switchImage.frame = RECT_FOR_OFF;
		self.backgroundImage.image = [UIImage imageNamed: self.switchOFF];
	}
}

/**
 * Check if on
 */
- (BOOL)isOn
{
	return _on;
}

/**
 * Capture user input
 */
- (void)buttonPressed:(id)target
{
	// We use a hit count to properly queue up multiple hits on the button while we are animating.
	if (_hitCount == 0)
	{
		_hitCount++;
		[self toggle];
	}
	else
	{
		_hitCount++;
		// Do not animate, this will happen when other animation finishes
	}
}

/**
 * Toggle ison
 */
- (void)toggle
{
	_on = !_on;
	[self animateSwitch:_on];
}

/**
 * Animate the switch by sliding halfway and then changing the background image and then sliding the rest of the way.
 */
- (void)animateSwitch:(BOOL)toOn
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.1];

	self.switchImage.frame = RECT_FOR_HALFWAY;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.1];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationHasFinished:finished:context:)];

	if (toOn)
	{
		self.switchImage.frame = RECT_FOR_ON;
		self.backgroundImage.image = [UIImage imageNamed: self.switchON];
	}
	else
	{
		self.switchImage.frame = RECT_FOR_OFF;
		self.backgroundImage.image = [UIImage imageNamed: self.switchOFF];
	}
	[UIView commitAnimations];
	
	[UIView commitAnimations];
}

/**
 * Remove the view no longer visible
 */
- (void)animationHasFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	if (_delegate)
	{
		[_delegate valueChangedInView:self];
	}
	
	// We use a hit count to properly queue up multiple hits on the button while we are animating.
	if (_hitCount > 1)
	{
		_hitCount--;
		[self toggle];
	}
	else
	{
		_hitCount--;
	}
}

@end