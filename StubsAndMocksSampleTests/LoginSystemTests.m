#import "TestHelpers.h"
#import "RESTRequest.h"

#import "LoginSystem.h"

SpecBegin(LoginSystemSpec)

    void(^givenApiConnectionWillReturnSuccess)(id <APIConnection> apiConnection, LoginRequest *loginRequest) = ^(id <APIConnection> apiConnection, LoginRequest *loginRequest) {
        [givenVoid([apiConnection invokeRESTRequest:loginRequest success:anything() failure:anything()]) willDo:^id(NSInvocation *invocation) {
            APIConnectionSuccessCallback successCallback = [invocation mkt_arguments][1];
            successCallback(@{@"success" : @"ok"});
            return nil;
        }];
    };

    void(^givenApiConnectionWillReturnError)(id <APIConnection> apiConnection, LoginRequest *loginRequest, NSError *error) = ^(id <APIConnection> apiConnection, LoginRequest *loginRequest, NSError *error) {
        [givenVoid([apiConnection invokeRESTRequest:loginRequest success:anything() failure:anything()]) willDo:^id(NSInvocation *invocation) {
            APIConnectionFailureCallback failureCallback = [invocation mkt_arguments][2];
            failureCallback(error);
            return nil;
        }];
    };

    describe(@"LoginSystem", ^{
        __block LoginSystem *systemUnderTest;
        __block LoginSystemLoginCallback emptyCallback = ^(BOOL success, NSError *error) {
        };
        __block id <APIConnection> apiConnection;

        beforeEach(^{
            apiConnection = mockProtocol(@protocol(APIConnection));
            systemUnderTest = [[LoginSystem alloc] initWithApiConnection:apiConnection];
        });

        afterEach(^{
            systemUnderTest = nil;
        });

        describe(@"loginWithRequest:callback:", ^{
            __block LoginRequest *loginRequest;
            before(^{
                loginRequest = [[LoginRequest alloc] initWithEmail:@"email@email.pl" password:@"password"];
            });

            it(@"should call api with request", ^{
                [systemUnderTest loginWithRequest:loginRequest callback:emptyCallback];
                [verify(apiConnection) invokeRESTRequest:loginRequest success:anything() failure:anything()];
            });

            context(@"when api return success", ^{
                before(^{
                    givenApiConnectionWillReturnSuccess(apiConnection,loginRequest);
                });

                it(@"should inform it's callbackout about success", ^{
                    __block BOOL successResult = NO;
                    [systemUnderTest loginWithRequest:loginRequest callback:^(BOOL success, NSError *error) {
                        successResult = success;
                    }];

                    expect(successResult).to.beTruthy();
                });
            });

            context(@"when api return failure", ^{
                before(^{
                    givenApiConnectionWillReturnError(apiConnection,loginRequest,[NSError new]);
                });

                it(@"should inform it's callback about fail", ^{
                    __block BOOL successResult = YES;
                    [systemUnderTest loginWithRequest:loginRequest callback:^(BOOL success, NSError *error) {
                        successResult = success;
                    }];

                    expect(successResult).toNot.beTruthy();
                });
            });
        });
    });

SpecEnd