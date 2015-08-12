//
//  MCViewCell.h
//  h5game
//
//  Created by xky on 15/8/7.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCViewCell : UICollectionViewCell
@property(nonatomic,copy)NSString *testTag;
/**
 *  添加字view
 *
 *  @param contentView <#contentView description#>
 */
-(void) addContentView:(UIView *)contentView;
@end
