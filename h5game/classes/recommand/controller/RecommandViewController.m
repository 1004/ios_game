//
//  RecommandViewController.m
//  h5game
//
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandViewController.h"
#import "HeaderViewPager.h"
#import "RecommandCell_1.h"
#import "RecommandCell_2.h"
#import "RecommandHeaderView.h"
#import "recommandDto.h"
#import "RecommandPresenter.h"
#import "RecommandData.h"
#import "SpecialGroupitem.h"
#import "MJRefresh.h"
#import "Page.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
@interface RecommandViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerView;
    recommandDto *_dto ;
}
@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,weak)UIView *bottomView;
@property(nonatomic,strong)NSMutableArray *firstData;
@property(nonatomic,strong)NSMutableArray *secondData;
@property(nonatomic,strong)NSMutableArray *thridData;
@property(nonatomic,strong)NSMutableArray *groups;
@property(nonatomic,strong)RecommandPresenter *presenter;
@end

@implementation RecommandViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)initDefaultView
{
    UITableView *tableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped]; //无悬浮
//     UITableView *tableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];//有悬浮
    tableView.backgroundColor = app_bg_color;
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView = tableView;
    
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];
    _bottomView = bottomView;
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void)initDefaultData
{
    NSDictionary *tableDict = @{@"tableView":_tableView};
    NSArray * tableConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:0 metrics:nil views:tableDict];

    NSArray *bottomHConts =   [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bottomView]-0-|" options:0 metrics:nil views:@{@"bottomView":_bottomView}];
    NSArray *bottomVConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tableView]-0-[bottomView(height)]-0-|" options:0 metrics:@{@"height":@(0)} views:@{@"tableView":_tableView,@"bottomView":_bottomView}];
    
    [self.view addConstraints:tableConts];
    [self.view addConstraints:bottomHConts];
    [self.view addConstraints:bottomVConts];

    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _bottomView.hidden = YES;
    
    _presenter = [[RecommandPresenter alloc]init];
    _firstData = [NSMutableArray array];
    _secondData = [NSMutableArray array];
    _thridData = [NSMutableArray array];
    _groups = [NSMutableArray arrayWithObjects:_firstData,_secondData,_thridData, nil];
    
    [self initRefreshData];
}

-(void) initRefreshData
{
    _footerView = [[MJRefreshFooterView alloc]init];
    _headerView = [[MJRefreshHeaderView alloc]init];
    _footerView.scrollView = _tableView;
    _headerView.scrollView = _tableView;
    
    _headerView.delegate = self;
    _footerView.delegate = self;
    
}

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    
    if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
        //下拉
        [self refreshData];
    }else{
        //上啦
        [self loadMoreData];
    }
}


-(void) tabViewRefreshData
{
    [self refreshData];
}

-(void) loadMoreData
{
//    XkyLog(@"-加载更多-%d,%d",_dto.page.pagenum,_dto.page.pagetotal);
       [_presenter loadNextData:^(recommandDto *dto) {
        _dto =dto;
        [_thridData addObjectsFromArray:dto.data.hotgamelist];
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }
        if (_dto.page.pagetotal <= _dto.page.pagenum) {
//            _footerView.endRefreshing
            XkyLog(@"-加载 loadNextData 更多-%d,%d",_dto.page.pagenum,_dto.page.pagetotal);
            [_footerView removeFromSuperview];
            XkyLog(@"-数据加载完毕-");
        }
        [_tableView reloadData];
    } Failed:^(NSError *error) {
        if (_footerView.isRefreshing) {
            [_footerView endRefreshing];
        }
    }];
}
                         

- (void)initDefaultDelegate
{
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _groups.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *groupData = _groups[section];
    return groupData.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return [self operateCommonCell:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self operateOtherCell:tableView cellForRowAtIndexPath:indexPath];
    }
}

-(UITableViewCell *) operateOtherCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommandCell_1 *cell = [RecommandCell_1 loadCell1ByXib:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone]; //（这种是没有点击后的阴影效果)
    SpecialGroupitem *item = _groups[indexPath.section][indexPath.row];
    [cell showBottomView:item.isShowbottom];
    [cell setGameData:item];
    return cell;
}
-(UITableViewCell *) operateCommonCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommandCell_2 *cell = [RecommandCell_2 loadCell2ByXib:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone]; //（这种是没有点击后的阴影效果)
    [cell initGameData:_groups[indexPath.section][indexPath.row]];
    return cell;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    RecommandHeaderView *headerView = [RecommandHeaderView loadXibView];
    switch (section) {
        case 0:
            [headerView headTitle:@"精品推荐"];
            break;
        case 1:
            [headerView headTitle:@"最近上架"];

            break;
        case 2:
            [headerView headTitle:@"热门游戏"];

            break;
            
        default:
            break;
    }
    return headerView;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
/**
 *  设置组间距
 组间距是由组的头部和组数据尾部构成
 *
 *  @param tableView <#tableView description#>
 *  @param section   <#section description#>
 *
 *  @return <#return value description#>
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 0.001;
    }else{
        return 20;
    }
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//   UIView *f =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//    return f;
//}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat hight = 0;
    if (indexPath.section == 2) {
        hight = 80;
    }else{
        SpecialGroupitem *item = _groups[indexPath.section][indexPath.row];
        hight =item.isShowbottom ? 125 :95;
    }
    return hight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}







/***********viewpager*************/
-(BOOL)viewPagerIsLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return !_firstData.count;
}


-(void)viewPagerPageLoadData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    _tableView.hidden = YES;
    [MBProgressHUD showMessage:@"加载数据" toView:self.view];
    [self refreshData];
    XkyLog(@"viewPagerPageLoadData%ld",index);
}


-(void) refreshData
{
    _footerView.scrollView = _tableView;

    [_presenter loadFirstData:^(recommandDto *dto) {
        _tableView.hidden = NO;
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        _dto = dto;
        [_firstData removeAllObjects];
        [_secondData removeAllObjects];
        [_thridData removeAllObjects];
        [_firstData addObjectsFromArray:[self convertGroupItem:dto.data.wxgamelist]];
        [_secondData addObjectsFromArray:[self convertGroupItem:dto.data.newgamelist]];
        [_thridData addObjectsFromArray:dto.data.hotgamelist];
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
        [_tableView reloadData];
//        XkyLog(@"%@",data);
    } Failed:^(NSError *error) {
        if (_headerView.isRefreshing) {
            [_headerView endRefreshing];
        }
    }];
}

-(NSMutableArray*) convertGroupItem:(NSArray*) data
{
    NSMutableArray *tempData = [NSMutableArray array];
    int groupItemCount = 2;
    if (data != nil) {
        for (int i =0 ; i<groupItemCount; i++) {
            SpecialGroupitem *item  = [[SpecialGroupitem alloc]init];
            if (i == groupItemCount-1) {
                item.isShowbottom=YES;
            }else{
                item.isShowbottom = NO;
            }
            NSMutableArray *tempItem = [NSMutableArray array];
            for (int j = i*4; j<(i+1)*4 && j<data.count; j++) {
                [tempItem addObject:data[j]];
            }
            item.itemData = tempItem;
            [tempData addObject:item];
        }
    }
    return tempData;
}

-(BOOL)viewPagerIsRefreshData:(HeaderViewPager *)viewPager position:(NSInteger)index
{
    return true;
}
-(void)viewPagerRefreshData:(HeaderViewPager *)viewpager position:(NSInteger)index
{
    XkyLog(@"viewPagerRefreshData--%ld",index);
    [_tableView reloadData];
}

-(void)viewPagerSection:(int)index
{
    XkyLog(@"---index--%d",index);
}

- (void)dealloc
{
    [_headerView free];
    [_footerView free];
}


@end
