//
//  BaseBiz.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetBase.h"

@protocol BaseBizDataSource;
@interface BaseBiz : NSObject<BaseBizDataSource>
/**
 *  传递参数
 *
 *  @param Key   <#Key description#>
 *  @param value <#value description#>
 */
-(void) bizPutParams:(NSString *)Key Value:(NSObject *) value;
/**
 *  biz层加载数据
 *
 *  @param success <#success description#>
 *  @param failed  failed description
 */
-(void) bizLoadDataParams:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
/**
 *  biz层加载第一页数据
 *
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */
-(void)bizLoadFirstData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;

/**
 *  biz曾加载第二页数据
 *
 *  @param success success description
 *  @param failed  <#failed description#>
 */
-(void)bizLoadNextData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;

@end
@protocol BaseBizDataSource <NSObject>
@required
-(NSString*) bizRequestUrl;
@required
-(void) bizInitParams:(NSArray *)params;
@end