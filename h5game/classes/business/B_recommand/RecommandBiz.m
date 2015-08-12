//
//  RecommandBiz.m
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandBiz.h"

@implementation RecommandBiz
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(NSString *)bizRequestUrl
{
    return RecommandPath;
}

-(void)bizInitParams:(NSArray *)params
{
    [self bizPutParams:@"act" Value:@(1)];
    [self bizPutParams:@"a" Value:@"recommend"];
    [self bizPutParams:@"c" Value:@"h5Recommend_v2.1"];
    
}
@end
