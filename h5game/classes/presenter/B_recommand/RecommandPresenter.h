//
//  RecommandPresenter.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BasePresenter.h"
@class recommandDto;
typedef void (^RECOMMANDSUCCESS)(recommandDto * data);
@interface RecommandPresenter : BasePresenter
//封装调用方法
-(void) loadFirstData:(RECOMMANDSUCCESS)success Failed:(HTTPFAILDE) failed;
-(void) loadNextData:(RECOMMANDSUCCESS)success Failed:(HTTPFAILDE) failed;
@end
