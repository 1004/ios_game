//
//  MainViewController.m
//  h5game
//
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MainViewController.h"
#import "HeaderViewPager.h"
#import "MyViewController.h"
#import "RecommandViewController.h"
#import "CompilationViewController.h"

@interface MainViewController ()<HeaderViewPagerDataSource,HeaderViewPagerDelegate>
@property(nonatomic,weak)HeaderViewPager *viewPager;
@property(nonatomic,strong)NSMutableArray *contentControllers;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initDefaultView
{
    HeaderViewPager *pager  = [[HeaderViewPager alloc]init];
    [self.view addSubview:pager];
    _viewPager = pager;
    [self.view setBackgroundColor:[UIColor blackColor]];
}

-(void) initDefaultData
{
    _viewPager.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *contantW =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[page]-0-|" options:0 metrics:nil views:@{@"page":_viewPager}];
    int top = (ios7 ? 20 : 0);
    NSArray *contantH =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[page]-0-|" options:0 metrics:@{@"top":@(top)} views:@{@"page":_viewPager}];
    [self.view addConstraints:contantW];
    [self.view addConstraints:contantH];
    
    NSArray * tabTitles = @[
                             @"我的",@"推荐",@"合集"
                             ];
    _viewPager.headTitles = tabTitles;
    [_viewPager setSectionPage:1];
    [self contentControllers];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (NSMutableArray *)contentControllers
{
    if (!_contentControllers) {
        _contentControllers = [NSMutableArray array];
        MyViewController *myController = [[MyViewController alloc]init];
        RecommandViewController *recommandController = [[RecommandViewController alloc]init];
        recommandController.mainViewController = self;
        CompilationViewController *compController = [[CompilationViewController alloc]init];
        compController.mainController =self;
        [_contentControllers addObject:myController];
        [_contentControllers addObject:recommandController];
        [_contentControllers addObject:compController];
    }
    return _contentControllers;
}

- (void)initDefaultDelegate
{
    _viewPager.delegate = self;
    _viewPager.datasource = self;
}

-(void)loadData
{
    
}

-(UIView *)viewPagerCellContentView:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    UIViewController * controller = (UIViewController*)_contentControllers[index];
    return controller.view;
}

-(BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    id<HeaderViewPagerDelegate> obj = _contentControllers[index];
    return [obj viewPagerIsLoadData:viewPager position:index];
}

-(void)viewPagerPageLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
     id<HeaderViewPagerDelegate> obj = _contentControllers[index];
    [obj viewPagerPageLoadData:viewPager position:index];
}

-(BOOL)viewPagerIsRefreshData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
  id<HeaderViewPagerDelegate> obj = _contentControllers[index];
    return [obj viewPagerIsRefreshData:viewPager position:index];
}

-(void)viewPagerRefreshData:(HeaderViewPager *)viewpager position:(NSInteger)index
{
     id<HeaderViewPagerDelegate> obj = _contentControllers[index];
    [obj viewPagerRefreshData:viewpager position:index];
}

-(void)viewPagerSection:(int)index
{
    id<HeaderViewPagerDelegate> obj = _contentControllers[index];
    [obj viewPagerSection:index];
}





@end
