//
//  ViewController.m
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.15.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//


#import "LoginViewController.h"
#import "LoginSystem.h"


@interface LoginViewController ()
@end

@implementation LoginViewController

- (IBAction)loginButtonPressed:(id)sender {
    LoginRequest *loginRequest = [[LoginRequest alloc] initWithEmail:self.emailTextField.text password:self.passwordTextField.text];
    if([self.loginSystem areCredentialValid:loginRequest])
        [self.loginSystem loginWithRequest:loginRequest callback:^(BOOL success, NSError *error) {

        }];
}


@end