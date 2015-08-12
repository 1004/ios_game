//
//  HeaderViewPager.m
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "HeaderViewPager.h"
#import "DefaultOperate.h"
#import "MHeader.h"
#import "MContent.h"
#import "ViewPagerContants.h"
#import "MCViewCell.h"
/**
 *  有两部分组成  头部  内容区
 */

@interface HeaderViewPager ()<MHeaderClickDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSString *cellTag ;
}
@property(nonatomic,weak) MHeader * mHeaderView;
@property(nonatomic,weak) MContent *mContentView;
@end
@implementation HeaderViewPager
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultView];
        [self initDefaultData];
        [self initDefaultDelegate];
    }
    return self;
}

/**
 *  初始化view
 */
-(void)initDefaultView
{
    MHeader *headerView = [[MHeader alloc]init];
    MContent *contentView =[MContent initWithLayout];
    
    [self addSubview:headerView];
    [self addSubview:contentView];
    
    _mHeaderView = headerView;
    _mContentView  = contentView;
}


//初始化数据
-(void)initDefaultData
{
 
    _mHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray  *headerWCons =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView]-0-|" options:0 metrics:nil views:@{@"headerView":_mHeaderView}];
    [self addConstraints:headerWCons];
    
    NSArray  *headerHCons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[headerView(height)]" options:0 metrics:@{@"height":@(XHEADER_H)} views:@{@"headerView":_mHeaderView}];
     [self addConstraints:headerHCons];
    
    _mContentView.translatesAutoresizingMaskIntoConstraints = NO;
   NSArray  *contentWCons =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentView]-0-|" options:0 metrics:nil views:@{@"contentView":_mContentView}];
    [self addConstraints:contentWCons];
    
   NSArray  *contentHCons  =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[headerView]-0-[contentView]-0-|" options:0 metrics:nil views:@{@"headerView":_mHeaderView,@"contentView":_mContentView}];
    [self addConstraints:contentHCons];
    
    cellTag = @"collectioncell";
  UICollectionViewFlowLayout  *layout=   (UICollectionViewFlowLayout*)_mContentView.collectionViewLayout ;
    [layout setItemSize:CGSizeMake(SCREENW, [UIScreen mainScreen].bounds.size.height-XHEADER_H-(ios7 ? 20 : 0))];
    
};

/**
 *  代理设置
 */
-(void)initDefaultDelegate
{
    _mHeaderView.delegate = self;
    //设置数据原代理
    _mContentView.delegate = self;
    _mContentView.dataSource = self;
//    _mContentView.
    [_mContentView registerNib:[UINib nibWithNibName:@"mcviewcell" bundle:nil] forCellWithReuseIdentifier:cellTag];
}
/**
 *  代理  标题点击
 *
 *  @param view  <#view description#>
 *  @param index index description
 */
-(void)click:(UIView *)view index:(int)index
{
    [_mContentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];    
      [self _chagePage:index];
}

/**
 *  设置标题
 *
 *  @param headTitles headTitles description
 */
- (void)setHeadTitles:(NSArray *)headTitles
{
    _headTitles = headTitles;
    _mHeaderView.headTitles = headTitles;
}

/**
 *  显示子view
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
//    XkyLog(@"layoutSubviews%ld",self.frame.size.width);
    
}
/**
 *  组数
 *
 *  @param collectionView <#collectionView description#>
 *
 *  @return <#return value description#>
 */
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
/**
 *  每组的个数
 *
 *  @param collectionView <#collectionView description#>
 *  @param section        <#section description#>
 *
 *  @return <#return value description#>
 */
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _headTitles.count;
}
/**
 *  当前视图
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 *
 *  @return return value description
 */
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MCViewCell * cell = [collectionView  dequeueReusableCellWithReuseIdentifier:cellTag forIndexPath:indexPath];
    //添加数据源
    if ([_datasource respondsToSelector:@selector(viewPagerCellContentView:position:)]) {
        UIView *cellView = [_datasource viewPagerCellContentView:self position:indexPath.item];
        [cell addContentView:cellView];
    }
    //加载数据
    if([_delegate respondsToSelector:@selector(viewPagerIsLoadData:position:)]){
        if ([_delegate viewPagerIsLoadData:self position:indexPath.item]) {
            if ([_delegate respondsToSelector:@selector(viewPagerPageLoadData:position:)]) {
                [_delegate viewPagerPageLoadData:self position:indexPath.item];
            }
        }
    }
    //刷新数据
    if ([_delegate respondsToSelector:@selector(viewPagerIsRefreshData:position:)]) {
        if ([_delegate viewPagerIsRefreshData:self position:indexPath.item]) {
            if ([_delegate respondsToSelector:@selector(viewPagerRefreshData:position:)]) {
                [_delegate viewPagerRefreshData:self position:indexPath.item];
            }
        }
    }
    
    
    return cell;
}
/**
 *  滑动结束
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
    int currentPage = (int)_mContentView.contentOffset.x/_mContentView.frame.size.width;
    [_mHeaderView setCheckPosition:currentPage];
//    XkyLog(@"scrollViewDidEndDecelerating--%d",currentPage);
}
/**
 *  选中页面
 *
 *  @param index index description
 */
-(void) setSectionPage:(int) index
{
    [_mContentView layoutIfNeeded];//优先加载界面  之后再设置选中页面
    [_mHeaderView setCheckPosition:index];
//    [_mContentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

-(void) _chagePage:(int) index
{
    if ([_delegate respondsToSelector:@selector(viewPagerSection:)]) {
        [_delegate viewPagerSection:index];
    }
}




@end
