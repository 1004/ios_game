//
//  recommandDto.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseCommonData.h"
@class RecommandData;
@interface recommandDto : ResponseCommonData
@property(nonatomic,strong)RecommandData *data;
@end
