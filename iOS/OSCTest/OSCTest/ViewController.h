//
//  ViewController.h
//  OSCTest
//
//  Created by Yasuhiro Takeda on 12/04/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVOSC.h"

@interface ViewController : UIViewController{

    OSCManager *_manager;
    OSCOutPort *_outPort;
    OSCInPort  *_inPort;
    
}

@end
