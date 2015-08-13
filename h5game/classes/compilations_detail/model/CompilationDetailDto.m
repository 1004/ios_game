//
//  CompilationDetailDto.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationDetailDto.h"
#import "MJExtension.h"
#import "Game.h"
@implementation CompilationDetailDto
-(NSDictionary *)arrayModelClasses
{
    return @{@"data":[Game class]};
}
@end
