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

- (void)loginWithRequest:(LoginRequest *)request callback:(LoginSystemLoginCallback)callback{
    self.usedRequest = request;
    if(!self.givenError)
        callback(YES,nil);
    else
        callback(NO,self.givenError);

}
@end
