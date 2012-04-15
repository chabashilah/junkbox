//
//  AppDelegate.h
//  OSCTest
//
//  Created by Yasuhiro Takeda on 12/04/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow * _window;
    UIViewController * _viewController;
}

@property (strong, nonatomic) UIWindow *window;
@end
