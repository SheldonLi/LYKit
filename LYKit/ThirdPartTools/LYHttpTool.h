//
//  LYHttpTool.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/30.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYHttpTool : NSObject

typedef void (^ly_httpSuccessBlock)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject);
typedef void (^ly_httpFailureBlock)(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error);
typedef void (^ly_httpProgressBlock)(NSProgress *_Nonnull progress);

typedef void (^ly_downloadSuccessBlock)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath);
typedef void (^ly_downloadFailureBlock)(NSError *_Nonnull error);

/**
 *  更新基础url
 *
 *  @param baseUrl 基础url
 */
+ (void)updateBaseUrl:(NSString *_Nullable)baseUrl;

/**
 *  设置基础url
 *
 *  @return 基础url
 */
+ (NSString *_Nullable)baseUrl;

/**
 *  设置全局请求头
 *
 *  @param httpHeaders 请求头字典
 */
+ (void)updateCommonHttpHeaders:(NSDictionary *_Nullable)httpHeaders;

/**
 *  更新超时时间
 *
 *  @param timeout 超时时间
 */
+ (void)updateRequestTimeout:(NSTimeInterval)timeout;

/**
 *  网络超时时间
 *
 *  @return 超时时间
 */
+ (NSTimeInterval)requestTimeout;

/**
 *  仅在Wifi状态下传输
 *
 *  @return 是否仅wifi传输
 */
+ (BOOL)onlyWifiTransfer;

/**
 *  开启或关闭接口打印信息
 *
 *  @param isDebug 开发期，最好打开，默认是NO
 */
+ (void)enableInterfaceDebug:(BOOL)isDebug;

/**
 *  get请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 */
+ (void)getWithURL:(NSString *_Nonnull)url
            params:(NSDictionary *_Nullable)params
           success:(ly_httpSuccessBlock _Nullable)success
           failure:(ly_httpFailureBlock _Nullable)failure;

/**
 *  post请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 */
+ (void)postWithURL:(NSString *_Nonnull)url
             params:(NSDictionary *_Nullable)params
            success:(ly_httpSuccessBlock _Nullable)success
            failure:(ly_httpFailureBlock _Nullable)failure;

/**
 *  get请求
 *
 *  @param url      请求地址
 *  @param params   请求参数
 *  @param progress 请求进度回调
 *  @param success  请求成功回调
 *  @param failure  请求失败回调
 */
+ (void)getWithURL:(NSString *_Nonnull)url
            params:(NSDictionary *_Nullable)params
          progress:(ly_httpProgressBlock _Nullable)progress
           success:(ly_httpSuccessBlock _Nullable)success
           failure:(ly_httpFailureBlock _Nullable)failure;

/**
 *  post请求
 *
 *  @param url      请求地址
 *  @param params   请求参数
 *  @param progress 请求进度回调
 *  @param success  请求成功回调
 *  @param failure  请求失败回调
 */
+ (void)postWithURL:(NSString *_Nonnull)url
            params:(NSDictionary *_Nullable)params
          progress:(ly_httpProgressBlock _Nullable)progress
           success:(ly_httpSuccessBlock _Nullable)success
           failure:(ly_httpFailureBlock _Nullable)failure;

/**
 *  下载请求(非background模式)
 *
 *  @param urlString    请求地址
 *  @param params       请求参数
 *  @param pathString   文件存储位置
 *  @param progress     请求进度回调
 *  @param success      请求成功回调
 *  @param failure      请求失败回调
 *
 *  @return 下载任务
 */
+ (NSURLSessionDownloadTask *_Nonnull)downloadWithURL:(NSString *_Nonnull)urlString
                                               params:(NSDictionary *_Nullable)params
                                      destinationpath:(NSString *_Nullable)pathString
                                             progress:(ly_httpProgressBlock _Nullable)progress
                                              success:(ly_downloadSuccessBlock _Nullable)success
                                              failure:(ly_downloadFailureBlock _Nullable)failure;

/**
 *  下载请求(background模式)
 *
 *  @param urlString    请求地址
 *  @param params       请求参数
 *  @param pathString   文件存储位置
 *  @param progress     请求进度回调
 *  @param success      请求成功回调
 *  @param failure      请求失败回调
 *
 *  @return 下载任务
 */
+ (NSURLSessionDownloadTask *_Nonnull)downloadInBackgroundWithURL:(NSString *_Nonnull)urlString
                                                           params:(NSDictionary *_Nullable)params
                                                  destinationpath:(NSString *_Nullable)pathString
                                                         progress:(ly_httpProgressBlock _Nullable)progress
                                                          success:(ly_downloadSuccessBlock _Nullable)success
                                                          failure:(ly_downloadFailureBlock _Nullable)failure;

@end
