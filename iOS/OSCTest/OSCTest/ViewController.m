//
//  ViewController.m
//  OSCTest
//
//  Created by Yasuhiro Takeda on 12/04/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (id) init	{
	NSLog(@"OSC init");
    
	_manager = [[OSCManager alloc] init];
	[_manager setDelegate:self];
    
	// sending
	NSString *sendingToIP = @"127.0.0.1";
	int sendingToPort = 1234;
	_outPort = [_manager createNewOutputToAddress:sendingToIP atPort:sendingToPort];
    
	// receiving
	int receivingOnPort = 1234;
	//inPort = [manager createNewInput]; // default at port 1234
	_inPort = [_manager createNewInputForPort:receivingOnPort];
    
	return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Setting delegate of OSCManager

    //Create output port and send one message
    OSCMessage *message = [OSCMessage createWithAddress:@"/test"];
    [message addInt:100];
    [_outPort sendThisPacket:[OSCPacket createWithContent:message]];
    
    //Create input port
    //Adding Label
    UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"OSC Test";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.autoresizingMask= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];    
    
    
    //Adding Transition Code
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.title = @"test";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) receivedOSCMessage:(OSCMessage *)m
{
    NSString *address = m.address;
    OSCValue *value = m.value;
    
    if ([address isEqualToString:@"/test"])
        NSLog(@"%d", value.intValue);
}

@end
