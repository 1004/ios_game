//
//  CompilationViewCell.h
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CompilationItemData;
@class CompilationData;

@protocol CompilationViewCellClickDelegate <NSObject>
-(void) clickItem:(CompilationData*) item;
@end

@interface CompilationViewCell : UITableViewCell
+(instancetype) loadCell1ByXib:(UITableView *)tableView;
-(void) initCompilationData:(CompilationItemData *)data;
@property(nonatomic,weak) id<CompilationViewCellClickDelegate> delegate;
@end

