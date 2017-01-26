//
//  JSONUtil.h
//  RESTConnector
//
//  Created by Mazdah on 2017. 1. 26..
//  Copyright © 2017년 mazdah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONUtil : NSObject

+ (NSString *) DictionaryToJSONString:(id)jsonObj;
+ (NSDictionary *) JSONDataToDictionary:(NSData *) jsonData;

@end
