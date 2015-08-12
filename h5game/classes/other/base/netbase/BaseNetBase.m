//
//  BaseNetBase.m
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BaseNetBase.h"
#import "PageCommParams.h"
#import "MJExtension.h"
#import "DeviceTools.h"

@interface BaseNetBase()
@property(nonatomic,strong) NSMutableDictionary *params;
@property(nonatomic,strong)PageCommParams *pageCommonParams;
@property(nonatomic,assign)BOOL isDataCome;
@end
@implementation BaseNetBase
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
    _params = [NSMutableDictionary dictionary];
    _pageCommonParams = [[PageCommParams alloc]init];
    _isDataCome = true;
}
/**
 *  传递参数
 *
 *  @param key   <#key description#>
 *  @param value <#value description#>
 */
-(void) putParamsKey:(NSString *) key Value:(NSObject*) value
{
    if (key != nil) {
        [_params setObject:value forKey:key];
    }
}

/**
 *  普通请求
 */
-(void) loadDataSuccess:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [self convert2Dict];
    if (_type == GET) {
        [self operateLoadDataGet:success error:failed];
    }else if (_type == POST){
        [self operateLoadDataPost:success error:failed];
    }
}

/**
 *  分页第一页请求
 */
-(void) loadFirstData:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    if (!_isDataCome) {
        return;
    }
    _pageCommonParams.pagenum = 1;
    _pageCommonParams.pagesize = PAGESIZE;
    _isDataCome = false;
    _pageCommonParams.token =  [self getMD5];
    
    [self loadDataSuccess:success error:failed];
}
/**
 *  分页第二页请求
 */
-(void) loadNextData:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    if (!_isDataCome) {
        return;
    }
    _pageCommonParams.pagenum = (_pageCommonParams.pagenum+1);
    _pageCommonParams.pagesize = PAGESIZE;
    _isDataCome = false;
    _pageCommonParams.token = [self getMD5];
    
    [self loadDataSuccess:success error:failed];
}

-(NSString*) getMD5
{
    NSString *orginStr = [NSString stringWithFormat:@"%d%d",_pageCommonParams.pagenum,_pageCommonParams.pagesize];
    NSString *firstMd5 = [DeviceTools md5HexDigest:orginStr];
    NSString *fistStr = [NSString stringWithFormat:@"HTML5GAME%@",firstMd5];
    return [DeviceTools md5HexDigest:fistStr];
}
/**
 *  加入通用参数
 */
-(void) convert2Dict
{
   NSDictionary * dict =  _pageCommonParams.keyValues;
    NSEnumerator *keys = [dict keyEnumerator];
    for (NSString * key in keys) {
       NSObject *value  =  [dict objectForKey:key];
        [self putParamsKey:key Value:value];
    }
}


-(void) operateLoadDataGet:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [NetTools operateGet:_url params:_params path:nil success:^(id Json) {
        _isDataCome = true;
        if (success) {
            success(Json);
        }
    } failed:^(NSError *error) {
        _isDataCome = true;
        if (failed) {
            failed(error);
        }
    }];
}
-(void) operateLoadDataPost:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    
    [NetTools operatePost:_url params:_params path:nil success:^(id Json) {
        _isDataCome = true;
        if (success) {
            success(Json);
        }
    } failed:^(NSError *error) {
        _isDataCome = true;
        if (failed) {
            failed(error);
        }
    }];
}



@end
