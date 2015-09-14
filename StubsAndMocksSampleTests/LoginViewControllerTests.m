//
//  LoginViewControllerTests.m
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.2015.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//
#import "TestHelpers.h"
#import "LoginViewController.h"
#import "LoginSystemStub.h"

SpecBegin(LoginViewControllerSpec)
describe(@"LoginViewController", ^{
    __block LoginViewController *subjectUnderTest;
    __block LoginSystem *loginSystem;
    __block UIStoryboard *storyboard;

    beforeAll(^{
       storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    });

    before(^{
        subjectUnderTest = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        loginSystem = mock([LoginSystem class]);
        subjectUnderTest.loginSystem =loginSystem;
        [subjectUnderTest view];
    });

    describe(@"loginButtonPressed:",^{
        context(@"when credential are valid",^{
            __block LoginRequest *expectedRequest;
            before(^{
                [given([loginSystem areCredentialValid:anything()]) willReturnBool:YES];

                NSString *expectedEmail = @"test@test.com";
                NSString *expectedPassword = @"password";
                subjectUnderTest.emailTextField.text = expectedEmail;
                subjectUnderTest.passwordTextField.text = expectedPassword;
                expectedRequest = [[LoginRequest alloc] initWithEmail:expectedEmail password:expectedPassword];
            });

            it(@"should login with loginSystem with credential provided by user",^{
                [subjectUnderTest loginButtonPressed:nil];
                [verify(loginSystem) loginWithRequest:expectedRequest];
            });
            
        });
    
    });
});

SpecEnd

