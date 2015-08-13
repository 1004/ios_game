//
//  BasePresenter.m
//  h5game
//业务逻辑层
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BasePresenter.h"
@interface BasePresenter()
@property(nonatomic,strong) BaseBiz *baseBiz;
@end
@implementation BasePresenter
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
    _baseBiz = [self presenterOperateBiz];
}
/**
 *  更换引擎
 *
 *  @param biz <#biz description#>
 */
-(void) changeBiz:(BaseBiz*) biz
{
    _baseBiz = biz;
}
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */
-(void) presenterLoadData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [ _baseBiz bizLoadDataParams:params :success error:failed];
}
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */

-(void)presenterLoadFirstData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [_baseBiz bizLoadFirstData:params :success error:failed];
}
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */

-(void)presenterLoadNextData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed
{
    [_baseBiz bizLoadNextData:params :success error:failed];
}

@end
