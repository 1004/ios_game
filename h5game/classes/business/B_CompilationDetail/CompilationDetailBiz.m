//
//  CompilationDetailBiz.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationDetailBiz.h"

@implementation CompilationDetailBiz
-(NSString *)bizRequestUrl
{
    return CompilationDetail_C;
}

-(void)bizInitParams:(NSArray *)params
{
    [self bizPutParams:@"categoryid" Value:params[0]];
}
@end
