//
//  CompilationViewController.m
//  h5game
//合集
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationViewController.h"
#import "HeaderViewPager.h"
#import "CompilationPresenter.h"
#import "CompilationDto.h"
#import "CompilationViewCell.h"
#import "CompilationItemData.h"
#import "MJRefresh.h"
#import "Page.h"
#import "MBProgressHUD+Add.h"
@interface CompilationViewController ()<MJRefreshBaseViewDelegate>
{
 
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerView;
    CompilationDto *_dto;
}
@property(nonatomic,strong)NSMutableArray *datas;

@property(nonatomic,strong)CompilationPresenter *presenter;

@end

@implementation CompilationViewController

-(void)initDefaultView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)initDefaultData
{
    _datas = [NSMutableArray array];
    _presenter = [[CompilationPresenter alloc]init];
    [self initRefreshData];
}

-(void)initDefaultDelegate
{
    
}
-(void) initRefreshData
{
    _footerView = [[MJRefreshFooterView alloc]init];
    _headerView = [[MJRefreshHeaderView alloc]init];
    _footerView.scrollView = self.tableView;
    _headerView.scrollView = self.tableView;
    self.tableView.backgroundColor = app_bg_color;
    
    _headerView.delegate = self;
    _footerView.delegate = self;
    
}

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    
    if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
        //下拉
        [self loadFirstData];
    }else{
        //上啦
        [self loadMoreData];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompilationViewCell *cell = [CompilationViewCell loadCell1ByXib:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone]; //（这种是没有点击后的阴影效果)
    [cell initCompilationData:_datas[indexPath.row]];
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

-(void) loadFirstData
{
    _footerView.scrollView = self.tableView;

    [_presenter loadFirstData:^(CompilationDto *dto) {
        _dto = dto;
        [_datas removeAllObjects];
        [_datas addObjectsFromArray:[self convertItem:dto.data]];
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.tableView reloadData];
    } Failed:^(NSError *error) {
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
    }];
}

-(void) loadMoreData
{
    [_presenter loadNextData:^(CompilationDto *dto) {
        _dto = dto;
        [_datas addObjectsFromArray:[self convertItem:dto.data]];
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }

        if (_dto.page.pagetotal <= _dto.page.pagenum) {
            XkyLog(@"-加载 loadNextData 更多-%d,%d",_dto.page.pagenum,_dto.page.pagetotal);
            [_footerView removeFromSuperview];
            XkyLog(@"-数据加载完毕-");
        }
        [self.tableView reloadData];
    } Failed:^(NSError *error) {
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }
    }];
}

-(NSArray*) convertItem:(NSArray *) data
{
   NSMutableArray *tempItem =  [NSMutableArray array];
    if (data != nil && data.count>0) {
        for (int i = 0; i<data.count; ) {
            CompilationItemData *item = [[CompilationItemData alloc]init];
            item.leftitem = data[i];
            if (data.count%2==0) {
                //偶数
                item.rightitem =data[i+1];
            }else{
                //基数
                if (i==(data.count-1)) {
                    
                }else{
                    item.rightitem =data[i+1];
                }
            }
            [tempItem addObject:item];
            i +=2;
        }
    }
    return tempItem;
}


- (BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return !_datas.count;
}

-(void)viewPagerPageLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    [MBProgressHUD showMessage:@"加载数据" toView:self.view];

    [self loadFirstData];
}


-(BOOL)viewPagerIsRefreshData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return true;
}
-(void)viewPagerRefreshData:(HeaderViewPager *)viewpager position:(NSInteger)index
{
    [self.tableView reloadData];
    
}

-(void)viewPagerSection:(int)index
{
    XkyLog(@"---index--%d",index);
}



@end
