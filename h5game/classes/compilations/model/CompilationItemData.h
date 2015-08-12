//
//  CompilationItemData.h
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CompilationData;
@interface CompilationItemData : NSObject
@property(nonatomic,strong)CompilationData *leftitem;
@property(nonatomic,strong)CompilationData *rightitem;
@end
