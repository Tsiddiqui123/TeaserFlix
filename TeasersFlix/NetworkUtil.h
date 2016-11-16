//
//  NetworkUtil.h
//  TeasersFlix
//
//  Created by Taha Siddiqui on 15/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestType) {
    RequestGetResponse = 1,
    RequestDownloadFile,
    RequestUploadFile
};

@interface NetworkUtil : NSObject <NSURLSessionDelegate,NSURLSessionDataDelegate,NSURLSessionTaskDelegate>

@property (nonatomic) RequestType requestType;
@property (nonatomic, strong) NSURL *requestUrl;
@property (nonatomic) int requestTimeout;

@property (nonatomic, strong) NSMutableData *responseData;

@end
