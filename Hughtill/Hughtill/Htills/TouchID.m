//
//  TouchID.m
//
//  Created by Hugh on 2018. 10. 15..
//  Copyright © 2018년 Hugh. All rights reserved.
//

#import "TouchID.h"

@implementation TouchID

+ (void) Starting:(success)success fail:(fail)fail cancel:(cancel)cancel
{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Touch ID Test to show Touch ID working in a custom app";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL touchsuccess, NSError *error) {
                                if (touchsuccess) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        //success
                                        if (success) success();
                                    });
                                } else {
                                    //fail
                                    if (fail) fail();
                                }
                            }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            //cancel
            if (cancel) cancel();
        });
    }

}
@end
