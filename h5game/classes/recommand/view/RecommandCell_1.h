//
//  RecommandCell_1.h
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SpecialGroupitem;
@interface RecommandCell_1 : UITableViewCell
+(instancetype) loadCell1ByXib:(UITableView *)tableView;
-(void) setGameIconTitles:(NSString *)iconPath title:(NSString *)title;
-(void) showBottomView:(BOOL) isShow;
-(void) setGameData:(SpecialGroupitem*) games;

@end
