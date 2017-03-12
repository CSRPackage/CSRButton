//
//  CSRApiManageer.h
//  CSRButton
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

/*
 * 写进https协议请求头的设备和API信息
 */
#define kDeviceClient   @"iphone"
#define kDeviceCode     @"4002"
#define kApiVersion     @"1.0"
/*
 * 写进https协议请求头的设备和API信息
 */

@interface CSRApiManageer : AFHTTPSessionManager

- (void)API:(NSString *)api
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSDictionary *datas))success
    failure:(void (^)(NSError *error))failure;

@end
