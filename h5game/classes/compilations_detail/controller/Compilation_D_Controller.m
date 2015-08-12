//
//  Compilation_D_Controller.m
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "Compilation_D_Controller.h"
#import "CompilationDetailPresenter.h"
#import "CompilationDetailDto.h"
#import "MBProgressHUD+Add.h"
#import "MJRefresh.h"
#import "Page.h"
#import "RecommandCell_2.h"
@interface Compilation_D_Controller ()<MJRefreshBaseViewDelegate>
{
    CompilationDetailDto *_dto;
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerView;

}
@property(nonatomic,strong)CompilationDetailPresenter *presenter;
@property(nonatomic,strong)NSMutableArray *datas;
@end

@implementation Compilation_D_Controller
-(void)initDefaultView
{
    [self initRefreshData];
}

-(void) initRefreshData
{
    _footerView = [[MJRefreshFooterView alloc]init];
    _headerView = [[MJRefreshHeaderView alloc]init];
    _footerView.scrollView = self.tableView;
    _headerView.scrollView = self.tableView;
    
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

-(void)initDefaultData
{
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    _datas = [NSMutableArray array];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)setType:(DetailType)type
{
    _presenter = [[CompilationDetailPresenter alloc]init];
    _type = type;
    _presenter.type = type;
}

-(void) back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)initDefaultDelegate
{
    
}

-(void)loadFirstData
{
    _footerView.scrollView = self.tableView;

    [_presenter detailLoadFirstDataParamsId:_d_Id Success:^(CompilationDetailDto *dto) {
        _dto = dto;
        [_datas removeAllObjects];
        [_datas addObjectsFromArray:dto.data];
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
        [self.tableView reloadData];
    } Failed:^(NSError *error) {
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
    }];
}

-(void)loadMoreData
{
    [_presenter detailLoadNextDataParamsId:_d_Id Success:^(CompilationDetailDto *dto) {
        _dto = dto;
        [_datas addObjectsFromArray:dto.data];
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }
        if (_dto.page.pagetotal <= _dto.page.pagenum) {
            //            _footerView.endRefreshing
            [_footerView removeFromSuperview];
        }
        [self.tableView reloadData];
        
    } Failed:^(NSError *error) {
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }
    }];
}
/**
 *  在设置完值后进行加载数据
 *
 *  @param d_Id <#d_Id description#>
 */
-(void)setD_Id:(NSString *)d_Id
{
    _d_Id = d_Id;
    [_headerView beginRefreshing];
    [self loadFirstData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommandCell_2 *cell = [RecommandCell_2 loadCell2ByXib:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone]; //（这种是没有点击后的阴影效果)
    [cell initGameData:_datas[indexPath.row]];

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)dealloc
{
    [_headerView free];
    [_footerView free];
}

@end
