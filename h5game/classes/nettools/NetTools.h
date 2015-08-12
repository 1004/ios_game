//
//  NetTools.h
//  WeiBo
//
//最基本的一个网络处理类
//  Created by xky on 15/7/17.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^HTTPSUCCESS)(id Json);
typedef void (^HTTPFAILDE)(NSError *error);
@interface NetTools : NSObject
+(void) operateGet:(NSString *) url params:(NSDictionary *)params path:(NSString *) path success:(HTTPSUCCESS) success failed:(HTTPFAILDE) failed;
+(void) operatePost:(NSString *) url params:(NSDictionary *)params path:(NSString *) path success:(HTTPSUCCESS) success failed:(HTTPFAILDE) failed;
@end
