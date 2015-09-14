//
// Created by Adam Borek on 11.09.15.
// Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRequest.h"

typedef void(^LoginSystemLoginCallback)(BOOL success, NSError *error);

@interface LoginSystem : NSObject
- (BOOL)areCredentialValid:(LoginRequest *)request;
- (void)loginWithRequest:(LoginRequest *)request callback:(LoginSystemLoginCallback)callback;
@end