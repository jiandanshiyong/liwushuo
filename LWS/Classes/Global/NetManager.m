//
//  NetManager.m
//  MSJ
//
//  Created by 张凯 on 16/7/11.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "NetManager.h"
#import "Reachability.h"

@implementation NetManager

+ (void)GET:(NSString *)urlStr
 parameters:(id)param
    success:(SuccessBlock)success
    failure:(FailureBlock)failure  {
    
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manage GET:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POST:(NSString *)urlStr
  parameters:(id)param
     success:(SuccessBlock)success
     failure:(FailureBlock)failure  {
    
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manage POST:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//判断网络
+ (NSInteger)isOline{
    
    int zero = 1000 ;
    Reachability *reacha = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reacha currentReachabilityStatus])
    {
        case NotReachable:{
            // 没有网络连接
            return zero;
            break;
        }
            
        case ReachableViaWWAN:{
            // 使用3G网络
            return 1;
            break;
        }
            
        case ReachableViaWiFi:{
            // 使用WiFi网络
            return 2;
            break;
        }
        case ReachableVia2G:{
            //  2G
            return 3;
            break;
        }
        case ReachableVia3G:
        {
            //  3G
            return 4;
            break;
        }
            
    }
    return zero ;
}


@end
