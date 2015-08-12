//
//  MHeader.h
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MHeaderClickDelegate <NSObject>

@optional
-(void) click:(UIView*) view index:(int) index;
@end
@interface MHeader : UIView
/**
 * 头部标题
 */
@property(nonatomic,strong)NSArray *headTitles;

/**
 *  点击的回调
 */
@property(nonatomic,weak)id<MHeaderClickDelegate> delegate;
/**
 *  设置选中
 *
 *  @param position <#position description#>
 */
-(void) setCheckPosition:(int) position;
@end


