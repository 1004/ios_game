//
//  BaseNetBase.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetTools.h"

typedef enum{
GET,
POST
} requetType;
@interface BaseNetBase : NSObject
/**
 *  最基本的URL
 */
@property(nonatomic,copy) NSString* url;
/**
 *  请求类型
 */
@property(nonatomic,assign) requetType type;
/**
 *  传递参数
 *
 *  @param key   key description
 *  @param value value description
 */
-(void) putParamsKey:(NSString *) key Value:(NSObject*) value;
/**
 *  普通请求
 */
-(void) loadDataSuccess:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
/**
 *  分页第一页请求
 */
-(void) loadFirstData:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
/**
 *  分页第二页请求
 */
-(void) loadNextData:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
@end
