//
//  AFNPostBlock.h
//  POST
//
//  Created by 七扇门 on 16/6/7.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^AFNData)(id block);

typedef void(^AFNDataError)(id blockError);

@interface AFNPostBlock : NSObject

+(void)getDataWithString:(NSString *)string body:(NSDictionary *)parameters block:(AFNData)block blockerror:(AFNDataError)blockError;


@end
