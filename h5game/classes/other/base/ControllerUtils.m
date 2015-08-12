//
//  ControllerUtils.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "ControllerUtils.h"
#import "BaseNaviViewController.h"
#import "PlayViewController.h"
#import "Game.h"
@implementation ControllerUtils
/**
 *  model形式跳转到推荐详情控制器
 *
 *  @param controller <#controller description#>
 *  @param type       <#type description#>
 *  @param title      <#title description#>
 *  @param did        <#did description#>
 */
+(void) openCompilationDetailControllerByContext:(UIViewController*)controller  Type:(DetailType) type Title:(NSString*)title DId:(NSString*)did
{
    Compilation_D_Controller *childController = [[Compilation_D_Controller alloc]init];
    BaseNaviViewController *navController = [[BaseNaviViewController alloc] initWithRootViewController:childController];
    childController.type = type;
    childController.title = title;
    childController.d_Id = did;
    navController.wantsFullScreenLayout = NO;
    navController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [controller presentViewController:navController animated:YES completion:nil];
//    [[controller navigationController] pushViewController:navController animated:YES];
//    BaseNaviViewController * nav  = (BaseNaviViewController*)controller.parentViewController;
//    [nav pushViewController:childController animated:YES];
}
/**
 *  启动播放页
 *
 *  @param controller <#controller description#>
 *  @param game       <#game description#>
 */
+(void) openPlayController:(UIViewController*)controller Game:(Game*)game
{
    PlayViewController *playController = [[PlayViewController alloc]init];
    playController.title = @"播放游戏";
    playController.game = game;
      BaseNaviViewController *navController = [[BaseNaviViewController alloc] initWithRootViewController:playController];
    navController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [controller presentViewController:navController animated:YES completion:nil];
}
@end
