//
//  CompilationPresenter.h
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BasePresenter.h"
@class CompilationDto;
typedef void (^COMPILATIONSUCCESS)(CompilationDto *dto);
@interface CompilationPresenter : BasePresenter
//封装调用方法
-(void) loadFirstData:(COMPILATIONSUCCESS)success Failed:(HTTPFAILDE) failed;
-(void) loadNextData:(COMPILATIONSUCCESS)success Failed:(HTTPFAILDE) failed;
@end
