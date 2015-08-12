//
//  MContent.m
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MContent.h"
#import "DefaultOperate.h"
#import "MContentLayout.h"
@interface MContent()<DefaultOperate>
@end
@implementation MContent
+(instancetype) initWithLayout
{

    MContentLayout *flowlayout = [[MContentLayout alloc]init];
    MContent *collectionView = [[MContent alloc]initWithFrame:CGRectMake(0, 0, 0, 0)  collectionViewLayout:flowlayout];
    collectionView.backgroundColor =app_bg_color;
    collectionView.pagingEnabled = true;
//    collectionView.bounces = NO;//不让滚动
    [collectionView setShowsHorizontalScrollIndicator:NO];
    return collectionView;
}

-(void)initDefaultData
{
//    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}


@end
