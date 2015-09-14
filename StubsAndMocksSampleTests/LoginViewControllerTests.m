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
        __block LoginSystemStub *loginSystemStub;
        __block UIStoryboard *storyboard;

        beforeAll(^{
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        });

        before(^{
            loginSystemStub = [LoginSystemStub new];

            subjectUnderTest = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            subjectUnderTest.loginSystem = loginSystemStub;
            [subjectUnderTest view];
        });

        describe(@"loginButtonPressed:", ^{
            context(@"when credential are valid", ^{
                __block LoginRequest *expectedRequest;
                before(^{
                    loginSystemStub.stubedAreCredentialValid = YES;

                    NSString *expectedEmail = @"test@test.com";
                    NSString *expectedPassword = @"password";
                    subjectUnderTest.emailTextField.text = expectedEmail;
                    subjectUnderTest.passwordTextField.text = expectedPassword;
                    expectedRequest = [[LoginRequest alloc] initWithEmail:expectedEmail password:expectedPassword];
                });

                it(@"should login with loginSystem with credential provided by user", ^{
                    [subjectUnderTest loginButtonPressed:nil];
                    expect(loginSystemStub.usedRequest).to.equal(expectedRequest);
                });

                //next test case like load wait indicator and so on ...
            });
        });
    });
SpecEnd

