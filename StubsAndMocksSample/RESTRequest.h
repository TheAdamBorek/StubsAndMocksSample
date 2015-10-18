//
// Created by Adam Borek on 18.10.2015.
// Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTRequest <NSObject>
- (NSString *)RESTMethod;
- (NSString*)APIMethod;
- (NSDictionary *)additionalHeaders;
- (NSDictionary *)params;
@end