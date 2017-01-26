//
//  RESTConnector.h
//  RESTConnector
//
//  Created by Mazdah on 2017. 1. 24..
//  Copyright © 2017년 mazdah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthInfo.h"

@protocol  RESTConnectorDelegate;

@interface RESTConnector : NSObject <NSURLSessionDataDelegate>

@property (nonatomic, assign)   id<RESTConnectorDelegate> delegate;
@property (nonatomic, strong)   NSMutableData   *receivedData;

- (id) init;
- (void) callApiWithURLStr:(NSString *)URLString method:(NSString *)method param:(NSString *)param;
@end

@protocol  RESTConnectorDelegate<NSObject>;

@required

- (void) receiveResponseDataToDictionary: (NSDictionary *) jsonDic;

@end
