//
//  CompilationDetailPresenter.h
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BasePresenter.h"
#import "Compilation_D_Controller.h"
@class CompilationDetailDto;
typedef void (^CompilationDSuccess) (CompilationDetailDto *dto);
@interface CompilationDetailPresenter : BasePresenter
-(void) detailLoadFirstDataParamsId:(NSString*) mid Success:(CompilationDSuccess) success Failed:(HTTPFAILDE) failed;
-(void) detailLoadNextDataParamsId:(NSString*) mid Success:(CompilationDSuccess) success Failed:(HTTPFAILDE) failed;
@property(nonatomic,assign) DetailType type;

@end
