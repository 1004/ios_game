//
//  H5TestController.m
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "H5TestController.h"
#import "HeaderViewPager.h"
#import "TestContentController.h"
@interface H5TestController ()<HeaderViewPagerDelegate,HeaderViewPagerDataSource>
@property(nonatomic,weak) HeaderViewPager*pager;
@property(nonatomic,strong)NSMutableArray *controllers;
@end

@implementation H5TestController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor redColor]];
    
//    [self.navigationBar setBackgroundColor:[UIColor blueColor]];
    
//    self.navigationBar.translucent = NO;

    HeaderViewPager *pager  = [[HeaderViewPager alloc]init];
    [self.view addSubview:pager];
    
   pager.translatesAutoresizingMaskIntoConstraints = NO;
   NSArray *contantW =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[page]-0-|" options:0 metrics:nil views:@{@"page":pager}];
    int top = (ios7 ? 20 : 0);
    NSArray *contantH =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[page]-0-|" options:0 metrics:@{@"top":@(top)} views:@{@"page":pager}];
    [self.view addConstraints:contantW];
    [self.view addConstraints:contantH];
    XkyLog(@"------");
    
    _pager = pager;
    [self controllers];

    [self operatedata];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    XkyLog(@"------");
}

- (NSMutableArray *)controllers
{
    _controllers = [NSMutableArray array];
    TestContentController * t1 = [[TestContentController alloc]init];
    TestContentController * t2 = [[TestContentController alloc]init];
    TestContentController * t3 = [[TestContentController alloc]init];
    [_controllers addObject:t1];
     [_controllers addObject:t2];
     [_controllers addObject:t3];
    return _controllers;
}

-(void) operatedata
{
    NSArray * testTitles = @[
                             @"我的",@"推荐",@"合集"
                             ];
    _pager.headTitles = testTitles;
    [_pager setSectionPage:1];
    
    
    _pager.delegate = self;
    _pager.datasource = self;
    
    
}



/**
 *  横竖屏判断，不知道为啥模拟器没调用
 *
 *  @param toInterfaceOrientation <#toInterfaceOrientation description#>
 *  @param duration               <#duration description#>
 */
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    BOOL landscape = UIInterfaceOrientationIsLandscape(toInterfaceOrientation); //判断是不是横屏
    if (landscape) {
        XkyLog(@"横");
    }else{
        XkyLog(@"书");
    }
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

}

-(UIView *)viewPagerCellContentView:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    UIViewController *c = (UIViewController*)_controllers[index];
    return  c.view;
}

-(BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    TestContentController *t = (TestContentController*)_controllers[index];
    
    return [t viewPagerIsLoadData:viewPager position:index];
}

-(void)viewPagerPageLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    TestContentController *t = (TestContentController*)_controllers[index];
    [t viewPagerPageLoadData:viewPager position:index];
}

-(BOOL)viewPagerIsRefreshData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    TestContentController *t = (TestContentController*)_controllers[index];
    return [t viewPagerIsRefreshData:viewPager position:index];
}

-(void)viewPagerRefreshData:(HeaderViewPager *)viewpager position:(NSInteger)index
{
    TestContentController *t = (TestContentController*)_controllers[index];
    [t viewPagerRefreshData:viewpager position:index];
}

-(void)viewPagerSection:(int)index
{
    TestContentController *t = (TestContentController*)_controllers[index];
    [t viewPagerSection:index];
}

@end
