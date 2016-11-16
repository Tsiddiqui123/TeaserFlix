//
//  NetworkUtil.m
//  TeasersFlix
//
//  Created by Taha Siddiqui on 15/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import "NetworkUtil.h"

@implementation NetworkUtil


-(instancetype)init
{
    self = [super init];
    self.requestTimeout = 40;
    return self;
}

- (void) constructAndStartRequest
{
    NSURLSessionTask *sessionTask;
    
    if (self.requestType == RequestGetResponse) sessionTask = [self constructResposneRequest];
    else if (self.requestType == RequestDownloadFile) sessionTask = [self constructDownloadRequest];
    
    [sessionTask resume];
}

- (NSURLSessionTask *) constructDownloadRequest
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[self getDownloadSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.requestUrl];
    
    return task;
}

- (NSURLSessionConfiguration *) getDownloadSessionConfiguration
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSDictionary *headers = @{@"Accept": @"application/json",
                              @"Content-Type": @"application/json"};
    
    sessionConfiguration.HTTPAdditionalHeaders = headers;
    sessionConfiguration.timeoutIntervalForRequest = self.requestTimeout;
    
    return sessionConfiguration;
}
- (NSURLSessionTask *) constructResposneRequest
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[self getResponseSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.requestUrl];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    return task;
}

- (NSURLSessionConfiguration *) getResponseSessionConfiguration
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSDictionary *headers = @{@"Accept": @"application/json",
                              @"Content-Type": @"application/json"};
    
    sessionConfiguration.HTTPAdditionalHeaders = headers;
    sessionConfiguration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    return sessionConfiguration;
}

-(NSArray *)recieveData
{
    if (!self.responseData) {
        return nil;
    }
    NSArray *arrData;
      id jsonObject = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:nil];
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        
        arrData = (NSArray *)jsonObject;
      //  dict = (NSMutableDictionary *)(jsonArray[0]);
    } else {
        
        //arrData = (NSMutableDictionary *)jsonObject;
        NSMutableDictionary *dict = (NSMutableDictionary *)jsonObject;
        arrData = [dict objectForKey:@"results"];
    }
    return arrData;
}

-(void)saveData
{
    
}




# pragma mark - URL SESSION DELEGATES

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error
{
    //    NSLog(@"url session error");
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    //    NSLog(@"url session background");
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task needNewBodyStream:(void (^)(NSInputStream *))completionHandler
{
    //    NSLog(@"need new stream");
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLRequest *))completionHandler
{
    //    NSLog(@"task redirect: %@", request.URL.absoluteString);
    
    completionHandler(request);
}

# pragma mark URL SESSION TASK DELEGATES

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error)
    {

    
    }
    else
    {
        [self recieveData];
        [self saveData];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    //    NSLog(@"task receive response");
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    //    NSLog(@"task send body");
}

#pragma mark - URL SESSION DATA TASK DELEGATES

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask
{
    //    NSLog(@"data did become download");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    //    NSLog(@"data recevice");
    
    [self.responseData appendData:data];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    //    NSLog(@"data receive response");
    
    if (self.requestType == RequestGetResponse) {
        self.responseData = [[NSMutableData alloc] init];
        completionHandler(NSURLSessionResponseAllow);
    } else if (self.requestType == RequestDownloadFile) {
        completionHandler(NSURLSessionResponseBecomeDownload);
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask willCacheResponse:(NSCachedURLResponse *)proposedResponse completionHandler:(void (^)(NSCachedURLResponse *))completionHandler
{
    //    NSLog(@"data will cache");
    
    completionHandler(proposedResponse);
}

@end
