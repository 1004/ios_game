//
//  ControllerUtils.h
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Compilation_D_Controller.h"
@class Game;
@interface ControllerUtils : NSObject
/**
 *  model形式跳转到推荐详情控制器
 *
 *  @param controller <#controller description#>
 *  @param type       <#type description#>
 *  @param title      <#title description#>
 *  @param did        <#did description#>
 */
+(void) openCompilationDetailControllerByContext:(UIViewController*)controller  Type:(DetailType) type Title:(NSString*)title DId:(NSString*)did;
/**
 *  启动播放页
 *
 *  @param controller <#controller description#>
 *  @param game       <#game description#>
 */
+(void) openPlayController:(UIViewController*)controller Game:(Game*)game;
@end
