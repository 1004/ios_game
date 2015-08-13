//
//  BaseNaviViewController.m
//  h5game
//最基本的导航控制器
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BaseNaviViewController.h"
#import "ViewPagerContants.h"

@interface BaseNaviViewController ()

@end

@implementation BaseNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

+(void)initialize
{
    UINavigationBar * bar = [UINavigationBar appearance];
    [bar setBackgroundColor:[UIColor blackColor]];
    [bar setBarTintColor:[UIColor blackColor]];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[UITextAttributeTextColor] = [UIColor whiteColor];
    dict[UITextAttributeFont] = [UIFont systemFontOfSize:17];
    [bar setTitleTextAttributes:dict];
    
    UIBarButtonItem * btnItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *btnDict = [NSMutableDictionary dictionary];
    btnDict[UITextAttributeFont] = [UIFont systemFontOfSize:16];
    btnDict[UITextAttributeTextColor] = [UIColor whiteColor];
    [btnItem setTitleTextAttributes:btnDict forState:UIControlStateNormal];
    [btnItem setTitleTextAttributes:btnDict forState:UIControlStateHighlighted];
}



-(void) initNavAttrs
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
