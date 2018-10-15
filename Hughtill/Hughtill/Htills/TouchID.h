//
//  TouchID.h
//
//  Created by Hugh on 2018. 10. 15..
//  Copyright © 2018년 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchID : NSObject
typedef void (^success)();
typedef void (^fail)();
typedef void (^cancel)();
+ (void) Starting:(success)success fail:(fail)fail cancel:(cancel)cancel;
@end

NS_ASSUME_NONNULL_END
