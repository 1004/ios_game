//
//  TestContentController.m
//  h5game
//
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "TestContentController.h"
#import "HeaderViewPager.h"
@interface TestContentController ()

@end

@implementation TestContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    XkyLog(@"TestContentController--viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return true;
}


-(void)viewPagerPageLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    XkyLog(@"viewPagerPageLoadData%ld",index);
}


-(BOOL)viewPagerIsRefreshData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return true;
}
-(void)viewPagerRefreshData:(HeaderViewPager *)viewpager position:(NSInteger)index
{
    XkyLog(@"viewPagerRefreshData--%ld",index);
}

-(void)viewPagerSection:(int)index
{
    XkyLog(@"---index--%d",index);
}

@end
