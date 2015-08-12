//
//  RecommandCell_2.h
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;
@interface RecommandCell_2 : UITableViewCell
+(instancetype) loadCell2ByXib:(UITableView *)tableView;
-(void) initGameData:(Game*) game;

@end
