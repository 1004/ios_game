//
//  RecommandPresenter.m
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandPresenter.h"
#import "RecommandBiz.h"
#import "MJExtension.h"
#import "recommandDto.h"
@implementation RecommandPresenter
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (BaseBiz *)presenterOperateBiz
{
    return [[RecommandBiz alloc]init];
}

//封装调用方法
-(void) loadFirstData:(RECOMMANDSUCCESS)success Failed:(HTTPFAILDE) failed
{
    [self presenterLoadFirstData:nil :^(id Json) {
        recommandDto *result = [recommandDto objectWithKeyValues:Json];
        if (success) {
            success(result);
        }
    } error:failed];
}

-(void) loadNextData:(RECOMMANDSUCCESS)success Failed:(HTTPFAILDE) failed
{
    [self presenterLoadNextData:nil :^(id Json) {
        recommandDto *result = [recommandDto objectWithKeyValues:Json];
        if (success) {
            success(result);
        }
    } error:failed];
}

@end
