//
//  CompilationPresenter.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationPresenter.h"
#import "CompilationBiz.h"
#import "CompilationDto.h"
#import "MJExtension.h"

@implementation CompilationPresenter


- (BaseBiz *)presenterOperateBiz
{
    return [[CompilationBiz alloc]init];
}

//封装调用方法
-(void) loadFirstData:(COMPILATIONSUCCESS)success Failed:(HTTPFAILDE) failed
{
    [self presenterLoadFirstData:nil :^(id Json) {
        CompilationDto *result = [CompilationDto objectWithKeyValues:Json];
        if (success) {
            success(result);
        }
    } error:failed];
}

-(void) loadNextData:(COMPILATIONSUCCESS)success Failed:(HTTPFAILDE) failed
{
    [self presenterLoadNextData:nil :^(id Json) {
        CompilationDto *result = [CompilationDto objectWithKeyValues:Json];
        if (success) {
            success(result);
        }
    } error:failed];
}

@end
