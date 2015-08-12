//
//  HeaderViewPager.h
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol DefaultOperate;
@protocol HeaderViewPagerDataSource;
@protocol HeaderViewPagerDelegate;
@interface HeaderViewPager : UIView<DefaultOperate>
/**
 *  设置标题
 */
@property(nonatomic,strong) NSArray *headTitles;
/**
 *  选中页
 *
 *  @param index <#index description#>
 */
-(void) setSectionPage:(int) index;
@property(nonatomic,weak) id<HeaderViewPagerDelegate> delegate;
@property(nonatomic,weak)id<HeaderViewPagerDataSource> datasource;
@end

@protocol HeaderViewPagerDataSource <NSObject>
/**
 *  填充cell中的view
 */
@required
-(UIView *) viewPagerCellContentView:(HeaderViewPager*) viewPager position:(NSInteger) index;
@end

@protocol HeaderViewPagerDelegate <NSObject>
/**
 *  load must data
 *   往往是只需要加载一次  要子类实现
 *  @param viewPager <#viewPager description#>
 *  @param index     <#index description#>
 */
@optional
-(void) viewPagerPageLoadData:(HeaderViewPager*) viewPager position:(NSInteger) index;
/**
 *  控制加载数据的开关
 *
 *  @param viewPager <#viewPager description#>
 *  @param index     <#index description#>
 *
 *  @return <#return value description#>
 */
@optional
-(BOOL) viewPagerIsLoadData:(HeaderViewPager*) viewPager position:(NSInteger) index;
/**
 *  刷新数据
 *
 *  @param viewpager <#viewpager description#>
 *  @param index     <#index description#>
 */
@optional
-(void) viewPagerRefreshData:(HeaderViewPager*) viewpager position:(NSInteger) index;
/**
 *  刷新数据的开关
 *
 *  @param viewPager <#viewPager description#>
 *  @param index     <#index description#>
 */
@optional
-(BOOL) viewPagerIsRefreshData:(HeaderViewPager *) viewPager position:(NSInteger) index;
/**
 *  显示的界面
 *
 *  @param index <#index description#>
 */
-(void) viewPagerSection:(int) index;

@end

