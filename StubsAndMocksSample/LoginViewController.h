//
//  ViewController.h
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.15.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//


#import <UIKit/UIKit.h>

@class LoginSystem;


@interface LoginViewController : UIViewController
@property (nonatomic, strong) LoginSystem *loginSystem;

- (void)loginButtonPressed;

@end
