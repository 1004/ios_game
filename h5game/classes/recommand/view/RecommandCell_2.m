//
//  RecommandCell_2.m
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandCell_2.h"
#import "Game.h"
#import "UIImageView+WebCache.h"
#import "NSString+ImgPath.h"
@interface RecommandCell_2()
@property (weak, nonatomic) IBOutlet UIImageView *gameIcon;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *gamenum;
@property (weak, nonatomic) IBOutlet UILabel *gameDesc;

@end

@implementation RecommandCell_2

+(NSString*) CellID2
{
    return @"RecommandCell_2";
}

+(instancetype) loadCell2ByXib:(UITableView *)tableView
{
  RecommandCell_2 * cell2 =   [tableView dequeueReusableCellWithIdentifier:[self CellID2]];
    if (cell2 == nil) {
        cell2 = [[NSBundle mainBundle] loadNibNamed:@"RecommandCell_2" owner:nil options:nil][0];
    }
    return cell2;
}
- (void)awakeFromNib {
    // Initialization code
}
-(void) initGameData:(Game*) game
{
    [_gameIcon sd_setImageWithURL:[NSURL URLWithString:[NSString getIconImgPath:game.game_pic]] placeholderImage:[UIImage imageNamed:@"defulticon"]];
    [_gameTitle setText:game.title];
    [_gamenum setText:[NSString stringWithFormat:@"人气:%@",game.game_population]];
    [_gameDesc setText:game.game_intro];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
