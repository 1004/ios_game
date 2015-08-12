//
//  Page.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Page : NSObject
/**
 *  总页数
 */
@property(nonatomic,assign) int pagetotal;
/**
 *  每页条数
 */
@property(nonatomic,assign) int pagecount;
/**
 *  当前页
 */
@property(nonatomic,assign) int pagenum;
@end
