//
//  RESTConnector.m
//  RESTConnector
//
//  Created by Mazdah on 2017. 1. 24..
//  Copyright © 2017년 mazdah. All rights reserved.
//

#import "RESTConnector.h"

@implementation RESTConnector

@synthesize delegate;
@synthesize receivedData;

- (id) init {
    self = [super init];

    return self;
}

- (void) setBaseUrl:(NSURL *)baseUrlParam {
    self.baseUrl = baseUrlParam;
}

- (void) callApiWithURLStr:(NSString *)URLString method:(NSString *)method param:(NSString *)param {
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSString *fullURLStr = [NSString stringWithFormat:@"%@%@", TILL60_BASE_URL, URLString];
    NSURL* url = [NSURL URLWithString:fullURLStr];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:method];
    
    if ([@"POST" isEqualToString:method]) {
        [urlRequest setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 태스크 생성
    NSURLSessionTask *currentTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [self.delegate receiveResponseData: data];
    }];
    // 태스크를 시작
    [currentTask resume];
}

/*
- (void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)dataTask didReceiveResponse:(NSURLResponse*)response completionHandler:(void(^)(NSURLSessionResponseDisposition))completionHandler {
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    // 상태 코드를 구한다
    long status = [httpResponse statusCode];
    if (status == 200) {
        // 저장용 객체를 초기화
        receivedData = [NSMutableData data];
        // 태스크를 계속한다
        completionHandler(NSURLSessionResponseAllow);
    } else {
        // 태스크를 중지한다
        completionHandler(NSURLSessionResponseCancel);
        
    }
}

- (void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)dataTask didReceiveData:(NSData*)data {
    // 데이터를 읽었을 때의 처리
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession*)session task:(NSURLSessionDataTask*)task didCompleteWithError:(NSError*)error {
    //...
    if (!error) {
        // 처리 완료
    } else {
        // 에러 시의 메시지
    }
}
*/
@end
