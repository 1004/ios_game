//
//  BasePresenter.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BaseBiz.h"
@protocol BasePresenterDataSource;
@interface BasePresenter : NSObject<BasePresenterDataSource>
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */
-(void) presenterLoadData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */

-(void)presenterLoadFirstData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;
/**
 *  子类可以封装该方法  然后进行模型的回调
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failed  <#failed description#>
 */

-(void)presenterLoadNextData:(NSArray*) params:(HTTPSUCCESS) success error:(HTTPFAILDE) failed;


@end

@protocol BasePresenterDataSource <NSObject>

/**
 *  数据核心操作层
 */
@optional
-(BaseBiz*) presenterOperateBiz;

@end
