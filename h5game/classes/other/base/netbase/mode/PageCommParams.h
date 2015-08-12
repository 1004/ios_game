//
//  PageCommParams.h
//  h5game
//  分页请求 通用参数
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageCommParams : NSObject
@property(nonatomic,assign) int pagenum;
@property(nonatomic,assign) int pagesize;
@property(nonatomic,copy)NSString *token;
@end
