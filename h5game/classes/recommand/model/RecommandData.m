//
//  RecommandData.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandData.h"
#import "MJExtension.h"
#import "Game.h"
@implementation RecommandData
- (NSDictionary *)arrayModelClasses
{
    return @{@"wxgamelist":[Game class],@"newgamelist":[Game class],@"hotgamelist":[Game class]};
}
@end
