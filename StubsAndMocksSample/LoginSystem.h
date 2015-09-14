//
// Created by Adam Borek on 11.09.15.
// Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRequest.h"

@interface LoginSystem : NSObject
- (BOOL)areCredentialValid:(LoginRequest *)request;
- (void)loginWithRequest:(LoginRequest *)request;
@end