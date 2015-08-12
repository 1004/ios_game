//
//  CompilationBiz.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationBiz.h"

@implementation CompilationBiz

-(NSString*) bizRequestUrl
{
    return CompilationPath;
}

-(void)bizInitParams:(NSArray *)params
{
    [self bizPutParams:@"a" Value:@"ablumlist"];
    [self bizPutParams:@"c" Value:@"h5ablum_v2.1"];
}

@end
