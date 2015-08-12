//
//  ResponseCommonData.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Status;
@class Page;
@interface ResponseCommonData : NSObject
@property(nonatomic,strong)Status *status;
@property(nonatomic,strong)Page *page;
@end
