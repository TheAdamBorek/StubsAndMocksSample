//
//  LoginSystemStub.h
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.2015.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import "LoginSystem.h"

@interface LoginSystemStub : LoginSystem
@property (nonatomic, strong) LoginRequest *usedRequest;
@property (nonatomic, assign) BOOL stubedAreCredentialValid;
@property(nonatomic, strong) NSError *givenError;
@end
