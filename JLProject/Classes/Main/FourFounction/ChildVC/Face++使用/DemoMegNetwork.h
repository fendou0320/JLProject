//
//  DemoMegNetwork.h
//  DemoMegLiveCustomUI
//
//  Created by Megvii on 2018/11/2.
//  Copyright © 2018 Megvii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RequestSuccess)(NSInteger statusCode, NSDictionary* responseObject);
typedef void(^RequestFailure)(NSInteger statusCode, NSError* error);

@interface DemoMegNetwork : NSObject

+ (DemoMegNetwork *)singleton;

- (void)queryDemoMGFaceIDAntiSpoofingBizTokenWithUUID:(NSString *)uuidStr imageRef:(UIImage *)imageRef1 liveConfig:(NSDictionary *)liveInfo success:(RequestSuccess)successBlock failure:(RequestFailure)failureBlock;

- (void)queryDemoMGFaceIDAntiSpoofingVerifyWithBizToken:(NSString *)bizTokenStr verify:(NSData *)megliveData success:(RequestSuccess)successBlock failure:(RequestFailure)failureBlock;

@end

NS_ASSUME_NONNULL_END
