//
//  CompilationViewCell.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "CompilationViewCell.h"
#import "CompilationItemData.h"
#import "UIImageView+WebCache.h"
#import "CompilationData.h"
@interface CompilationViewCell()
@property (weak, nonatomic) IBOutlet UIView *leftContainer;
@property (weak, nonatomic) IBOutlet UIImageView *leftIcon;
@property (weak, nonatomic) IBOutlet UILabel *leftTitle;
@property (weak, nonatomic) IBOutlet UILabel *leftCount;

@property (weak, nonatomic) IBOutlet UIView *rightContainer;
@property (weak, nonatomic) IBOutlet UIImageView *rightIcon;
@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (weak, nonatomic) IBOutlet UILabel *rightCount;



@end
@implementation CompilationViewCell
+(NSString*) CellID
{
    return @"CompilationViewCell";
}

+(instancetype) loadCell1ByXib:(UITableView *)tableView
{
    CompilationViewCell * cell1 =   [tableView dequeueReusableCellWithIdentifier:[self CellID]];
    if (cell1 == nil) {
        cell1 = [[NSBundle mainBundle] loadNibNamed:@"CompilationViewCell" owner:nil options:nil][0];
    }else{
    }
    return cell1;
}

-(void) initCompilationData:(CompilationItemData *)data
{
    [_leftIcon sd_setImageWithURL:[NSURL URLWithString:data.leftitem.category_cover] placeholderImage:[UIImage imageNamed:@"banner_default_icon"]];
    [_leftTitle setText:data.leftitem.category_name];
    [_leftCount setText:[NSString stringWithFormat:@"共有%@款游戏",data.leftitem.category_gamecount]];
    if (data.rightitem) {
        [_rightIcon sd_setImageWithURL:[NSURL URLWithString:data.rightitem.category_cover] placeholderImage:[UIImage imageNamed:@"banner_default_icon"]];
        [_rightTitle setText:data.rightitem.category_name];
        [_rightCount setText:[NSString stringWithFormat:@"共有%@款游戏",data.rightitem.category_gamecount]];
    }
}




@end
