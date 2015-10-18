//
//  LoginRequest.h
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.2015.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIConnection.h"

@interface LoginRequest : NSObject <RESTRequest>
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password;

- (NSString *)description;

+ (instancetype)requestWithEmail:(NSString *)email password:(NSString *)password;

@end
