//
// Created by Adam Borek on 11.09.15.
// Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import "LoginSystem.h"


@implementation LoginSystem
- (instancetype)initWithApiConnection:(id <APIConnection>)apiConnection {
    self = [super init];
    if (self) {
        self.apiConnection = apiConnection;
    }

    return self;
}

+ (instancetype)systemWithApiConnection:(id <APIConnection>)apiConnection {
    return [[self alloc] initWithApiConnection:apiConnection];
}


- (BOOL)areCredentialValid:(LoginRequest *)request{
    return YES;
}

- (void)loginWithRequest:(LoginRequest *)request  callback:(LoginSystemLoginCallback)callback{
    [self.apiConnection invokeRESTRequest:request success:^(id response) {
        [self tryToInvokeCallback:callback error:nil];
    } failure:^(NSError *error) {
        [self tryToInvokeCallback:callback error:error];
    }];
}

- (void)tryToInvokeCallback:(LoginSystemLoginCallback)callback error:(NSError *)error {
    if(callback)
        callback(error == nil,error);
}

@end