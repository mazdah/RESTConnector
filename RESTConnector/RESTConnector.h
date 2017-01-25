//
//  RESTConnector.h
//  RESTConnector
//
//  Created by Mazdah on 2017. 1. 24..
//  Copyright © 2017년 mazdah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthInfo.h"

@interface RESTConnector : NSObject <NSURLSessionDataDelegate>

@property (nonatomic, strong)   NSMutableData  *receivedData;

- (id) init;
- (void) callApiWithURLStrResultData:(NSString *)URLString;
@end
