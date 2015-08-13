//
//  RecommandData.h
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommandData : NSObject
@property(nonatomic,copy)NSString *wxgameid;
@property(nonatomic,copy)NSString *newgameid;
@property(nonatomic,strong)NSArray *wxgamelist;
@property(nonatomic,strong)NSArray *newgamelist;
@property(nonatomic,strong)NSArray *hotgamelist;
@end
