//
//  CompilationViewCell.h
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CompilationItemData;
@interface CompilationViewCell : UITableViewCell
+(instancetype) loadCell1ByXib:(UITableView *)tableView;
-(void) initCompilationData:(CompilationItemData *)data;

@end
