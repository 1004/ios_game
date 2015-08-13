//
//  CompilationDetailPresenter.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationDetailPresenter.h"
#import "CompilationDetailBiz.h"
#import "CompilationDetail_R.h"
#import "CompilationDetailDto.h"
#import "MJExtension.h"
@implementation CompilationDetailPresenter
-(BaseBiz *)presenterOperateBiz
{
    return [[CompilationDetailBiz alloc]init];
}

-(void)setType:(DetailType)type
{
        _type = type;
        if (_type == ONLINE) {
            [self changeBiz: [[CompilationDetailBiz alloc]init]];
        }else {
            [self changeBiz:[[CompilationDetail_R alloc]init]];
        }
}

-(void) detailLoadFirstDataParamsId:(NSString*) mid Success:(CompilationDSuccess) success Failed:(HTTPFAILDE) failed
{
    [self presenterLoadFirstData:@[mid] :^(id Json) {
        CompilationDetailDto *result = [CompilationDetailDto objectWithKeyValues:Json];
        if (success) {
            success(result);
        }

    } error:failed];
}

-(void) detailLoadNextDataParamsId:(NSString*) mid Success:(CompilationDSuccess) success Failed:(HTTPFAILDE) failed
{
   [self presenterLoadNextData:@[mid] :^(id Json) {
       CompilationDetailDto *result = [CompilationDetailDto objectWithKeyValues:Json];
       if (success) {
           success(result);
       }
   } error:failed];

}




@end
