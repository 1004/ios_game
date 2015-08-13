//
//  RecommandCell_1.h
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    WX,
    NEST
} groupType;
@class Game;
@protocol RecommandCell_1Delegate <NSObject>

//暂时一个方法，后期会有游戏点击
@optional
-(void) clickBottom:(groupType) type;
@optional
-(void) clickgame:(Game*) game;

@end
@class SpecialGroupitem;
@interface RecommandCell_1 : UITableViewCell
+(instancetype) loadCell1ByXib:(UITableView *)tableView;
-(void) setGameIconTitles:(NSString *)iconPath title:(NSString *)title;
-(void) showBottomView:(BOOL) isShow;
-(void) setGameData:(SpecialGroupitem*) games;
-(void) setGameGroupDelegate:(groupType) groupType delegate:(id<RecommandCell_1Delegate>) delegate;
@end
