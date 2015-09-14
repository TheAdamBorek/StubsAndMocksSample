//
//  LoginRequest.m
//  StubsAndMocksSample
//
//  Created by Adam Borek on 11.09.2015.
//  Copyright (c) 2015 Adam Borek. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest
- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (self) {
        self.email = email;
        self.password = password;
    }

    return self;
}

+ (instancetype)requestWithEmail:(NSString *)email password:(NSString *)password {
    return [[self alloc] initWithEmail:email password:password];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self arePropertiesEqual:other];
}


- (BOOL)arePropertiesEqual:(LoginRequest *)other {
    BOOL (^areEmailsEqual)() = ^BOOL {
        return [self.email isEqualToString:other.email];
    };

    BOOL (^arePasswordsEqual)() = ^BOOL {
        return [self.password isEqualToString:other.password];
    };

    return areEmailsEqual() && arePasswordsEqual();
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.email=%@", self.email];
    [description appendFormat:@", self.password=%@", self.password];
    [description appendString:@">"];
    return description;
}

@end
