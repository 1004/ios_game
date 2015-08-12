//
//  MContentLayout.m
//  h5game
//
//  Created by xky on 15/8/7.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MContentLayout.h"

@implementation MContentLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(void) initData
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;

}
@end
