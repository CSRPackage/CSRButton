//
//  CSRApiManageer.m
//  CSRButton
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "CSRApiManageer.h"
#import "OpenUDID.h"

@implementation CSRApiManageer
- (void)API:(NSString *)api
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSDictionary *datas))success
    failure:(void (^)(NSError *error))failure
{
    [self updateHeader];
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
    
    NSDictionary * jsonParameters = @{};
    if ([NSJSONSerialization isValidJSONObject:parameters]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsonParameters = @{@"json":jsonString};
    }
    
    [self POST:api parameters:jsonParameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *datas = (NSDictionary *)responseObject;
            success(datas);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",task.response);
        if (failure) {
            failure(error);
        }
    }];
}
- (void)API:(NSString *)api parameters:(NSDictionary *)parameters uploadImageArray:(NSArray *)photos success:(void (^)(NSDictionary *datas))success failure:(void (^)(NSError *error))failure
{
    [self updateHeader];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
    NSDictionary * jsonParameters = @{};
    if ([NSJSONSerialization isValidJSONObject:parameters]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsonParameters = @{@"json":jsonString};
    }
    
    [self POST:api parameters:jsonParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (photos.count > 0) {
            for(NSInteger i = 0; i < photos.count; i++) {
                NSData *imageData = [[photos objectAtIndex:i] objectForKey:@"imagedata"];
                NSString *imageName = [NSString stringWithFormat:@"%@", [[photos objectAtIndex:i] objectForKey:@"imagename"]];
                [formData appendPartWithFileData:imageData name:imageName fileName:@"image" mimeType:@"image/png"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"uploadProgress.localizedDescription %@", uploadProgress.localizedDescription);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *datas = (NSDictionary*)responseObject;
            success(datas);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)updateHeader
{
    [self.requestSerializer setValue:[OpenUDID value] forHTTPHeaderField:@"Device-udid"];
    [self.requestSerializer setValue:kDeviceClient forHTTPHeaderField:@"Device-client"];
    [self.requestSerializer setValue:kDeviceCode forHTTPHeaderField:@"Device-code"];
    [self.requestSerializer setValue:kApiVersion forHTTPHeaderField:@"Api-version"];
}
@end
