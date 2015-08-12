//
//  BaseBiz.m
//  h5game
//数据源方法有子类实现
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BaseBiz.h"
@interface BaseBiz()
@property(nonatomic,strong) BaseNetBase *netBase;
@end
@implementation BaseBiz
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}


-(void) initData
{
    _netBase = [[BaseNetBase alloc]init];
    _netBase.url = [self bizRequestUrl];
}
/**
 *  传递参数
 *
 *  @param Key   <#Key description#>
 *  @param value <#value description#>
 */
-(void) bizPutParams:(NSString *)Key Value:(NSObject *) value
{
    [_netBase putParamsKey:Key Value:value];
}

/**
 *  biz层加载数据
 *
 *  @param success <#success description#>
 *  @param failed  failed description
 */
-(void) bizLoadDataParams:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [self bizInitParams:params];
    [_netBase loadDataSuccess:success error:failed];
}
/**
 *  biz层加载第一页数据
 *
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */
-(void)bizLoadFirstData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [self bizInitParams:params];
    [_netBase loadFirstData:success error:failed];
}
/**
 *  biz曾加载第二页数据
 *
 *  @param success success description
 *  @param failed  <#failed description#>
 */
-(void)bizLoadNextData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [self bizInitParams:params];
    [_netBase loadNextData:success error:failed];
}

-(NSString *)bizRequestUrl
{
    return @"";
}

-(void)bizInitParams:(NSArray *)params
{
    
}
@end
