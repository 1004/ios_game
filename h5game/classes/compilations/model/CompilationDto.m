//
//  CompilationDto.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationDto.h"
#import "MJExtension.h"
#import "CompilationData.h"
@implementation CompilationDto
-(NSDictionary *)arrayModelClasses
{
    return @{@"data":[CompilationData class]};
}
@end
