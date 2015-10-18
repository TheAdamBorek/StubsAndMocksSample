//
// Created by Adam Borek on 18.10.2015.
// Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTRequest;

typedef void(^APIConnectionSuccessCallback)(id response);
typedef void(^APIConnectionFailureCallback)(NSError *error);


@protocol APIConnection <NSObject>
- (void)invokeRESTRequest:(id<RESTRequest>)request success:(APIConnectionSuccessCallback)success failure:(APIConnectionFailureCallback)failure;
@end