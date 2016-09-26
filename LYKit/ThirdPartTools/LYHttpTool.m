//
//  LYHttpTool.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/30.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "LYHttpTool.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworking.h>

#ifdef DEBUG
#define LYHttpLog(s, ...)                                                         \
    NSLog(@"[%@：in line: %d]-->[message: %@]",                                   \
          [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, \
          [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define LYHttpLog(s, ...)
#endif

//  网络静态参数设置
static NSTimeInterval ly_requestTimeout = 30;
//  基础地址
static NSString *ly_baseURLString = nil;
//  是否开启调试
static BOOL ly_isEnableInterfaceDebug = NO;
//  请求头
static NSDictionary *ly_httpHeaders = nil;

@implementation LYHttpTool

+ (void)updateRequestTimeout:(NSTimeInterval)timeout {
    ly_requestTimeout = timeout;
}

+ (NSTimeInterval)requestTimeout {
    return ly_requestTimeout;
}

+ (void)updateBaseUrl:(NSString *)baseUrl {
    ly_baseURLString = baseUrl;
}

+ (NSString *)baseUrl {
    return ly_baseURLString;
}

+ (void)updateCommonHttpHeaders:(NSDictionary *)httpHeaders {
    ly_httpHeaders = httpHeaders;
}

+ (void)enableInterfaceDebug:(BOOL)isDebug {
    ly_isEnableInterfaceDebug = isDebug;
}

+ (BOOL)isDebug {
    return ly_isEnableInterfaceDebug;
}

+ (AFHTTPSessionManager *)managerInit {
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    //  初始化BaseUrl
    AFHTTPSessionManager *manager =
        [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ly_baseURLString]];

    //  JSON序列化
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.requestSerializer.timeoutInterval = [self requestTimeout];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    manager.responseSerializer.acceptableContentTypes = [NSSet
        setWithArray:@[ @"application/json", @"text/html", @"text/json", @"text/javascript" ]];
    //  请求头设置
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    for (NSString *key in ly_httpHeaders.allKeys) {
        if (ly_httpHeaders[key]) {
            [manager.requestSerializer setValue:ly_httpHeaders[key] forHTTPHeaderField:key];
        }
    }
    // 设置允许同时最大并发数量，过大容易出问题
    manager.operationQueue.maxConcurrentOperationCount = 5;

    return manager;
}

+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(ly_httpSuccessBlock)success
           failure:(ly_httpFailureBlock)failure {
    [self getWithURL:url params:params progress:nil success:success failure:failure];
}

+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
            success:(ly_httpSuccessBlock)success
            failure:(ly_httpFailureBlock)failure {
    [self postWithURL:url params:params progress:nil success:success failure:failure];
}

+ (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
           progress:(ly_httpProgressBlock)progress
            success:(ly_httpSuccessBlock)success
            failure:(ly_httpFailureBlock)failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self managerInit];

    [manager POST:url
        parameters:params
        progress:^(NSProgress *_Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        }
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            if (success) {
                success(task, responseObject);
            }
            if ([self isDebug]) {
                [self logWithSuccessResponse:responseObject
                                         url:task.response.URL.absoluteString
                                      params:params];
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            if (failure) {
                failure(task, error);
            }
            if ([self isDebug]) {
                [self logWithFailError:error url:task.response.URL.absoluteString params:params];
            }
        }];
}

+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
          progress:(ly_httpProgressBlock)progress
           success:(ly_httpSuccessBlock)success
           failure:(ly_httpFailureBlock)failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self managerInit];

    [manager GET:url
        parameters:params
        progress:^(NSProgress *_Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        }
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            if (success) {
                success(task, responseObject);
            }
            if ([self isDebug]) {
                [self logWithSuccessResponse:responseObject
                                         url:task.response.URL.absoluteString
                                      params:params];
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            if (failure) {
                failure(task, error);
            }
            if ([self isDebug]) {
                [self logWithFailError:error url:task.response.URL.absoluteString params:params];
            }
        }];
}

+ (void)logWithSuccessResponse:(id)response url:(NSString *)url params:(NSDictionary *)params {
    LYHttpLog(@"\nabsoluteUrl: %@\n params:%@\n response:%@\n\n", url, params, response);
}

+ (void)logWithFailError:(NSError *)error url:(NSString *)url params:(NSDictionary *)params {
    LYHttpLog(@"\nabsoluteUrl: %@\n params:%@\n errorInfos:%@\n\n", url, params,
              [error localizedDescription]);
}

@end
