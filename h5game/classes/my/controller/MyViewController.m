//
//  MyViewController.m
//  h5game
//
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MyViewController.h"
#import "HeaderViewPager.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initDefaultView
{
    
}

- (void)initDefaultData
{
    
}

-(void)initDefaultDelegate
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
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
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    NSArray *c1s = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(50)]" options:0 metrics:nil views:@{@"view":view}];
    [self.view addConstraints:c1s];
    
    NSArray *cis2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(50)]" options:0 metrics:nil views:@{@"view":view}];
    [self.view addConstraints:cis2];
    
    NSLayoutConstraint* icis3 =  [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:icis3];

}

-(void)viewPagerSection:(int)index
{
    XkyLog(@"---index--%d",index);
}



@end
