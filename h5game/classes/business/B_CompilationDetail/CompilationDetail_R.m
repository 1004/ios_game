//
//  CompilationDetail_R.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationDetail_R.h"

@implementation CompilationDetail_R
-(NSString *)bizRequestUrl
{
    return CompliatinDetail_R;
}

-(void)bizInitParams:(NSArray *)params
{
    [self bizPutParams:@"categoryid" Value:params[0]];
}
@end
