//
//  LoginSystemStub.m
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.2015.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import "LoginSystemStub.h"

@implementation LoginSystemStub

- (BOOL)areCredentialValid:(LoginRequest *)request{
    return self.stubedAreCredentialValid;
}

- (void)loginWithRequest:(LoginRequest *)request{
    self.usedRequest = request;
}
@end
