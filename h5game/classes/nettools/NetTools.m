//
//  NetTools.m
//  WeiBo
//
//  Created by xky on 15/7/17.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "NetTools.h"
#import "AFNetworking.h"
@implementation NetTools
+ (void)operateGet:(NSString *) url params:(NSDictionary *)params path:(NSString *) path success:(HTTPSUCCESS)success failed:(HTTPFAILDE)failed
{
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:url]];
    
    NSURLRequest * request = [client requestWithMethod:@"GET" path:path   parameters:params];
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(json);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failed) {
            failed(error);
        }
    }];
    //请求
    [operation start];
}

+(void) operatePost:(NSString *) url params:(NSDictionary *)params path:(NSString *) path success:(HTTPSUCCESS)success failed:(HTTPFAILDE)failed
{
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:url]];
    NSURLRequest * request = [client requestWithMethod:@"POST" path:path parameters:params];
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failed) {
            failed(error);
        }
    }];
    [operation start];
}


@end
