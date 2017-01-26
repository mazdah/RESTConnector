//
//  JSONUtil.m
//  RESTConnector
//
//  Created by Mazdah on 2017. 1. 26..
//  Copyright © 2017년 mazdah. All rights reserved.
//

#import "JSONUtil.h"

@implementation JSONUtil

+ (NSString *) DictionaryToJSONString:(id)jsonObj {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObj
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (error != nil) {
        NSLog(@"NSJSONSerialization dataWithJSONObject ERROR : %@", error.localizedDescription);
        return nil;
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *) JSONDataToDictionary:(NSData *) jsonData {
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"NSJSONSerialization JSONObjectWithData ERROR : %@", error.localizedDescription);
        return nil;
    }
    
    return dic;
}

@end
