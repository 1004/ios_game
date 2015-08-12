//
//  RecommandCell_1.m
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandCell_1.h"
#import "SpecialGroupitem.h"
#import "Game.h"
#import "UIImageView+WebCache.h"
#import "NSString+ImgPath.h"
#import "TapGestureRecognizerParam.h"
@interface RecommandCell_1()
@property (weak, nonatomic) IBOutlet UIView *gameContainer1;
@property (weak, nonatomic) IBOutlet UIView *gameContainer2;
@property (weak, nonatomic) IBOutlet UIView *gameContainer3;
@property (weak, nonatomic) IBOutlet UIView *gameContainer4;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle1;
@property (weak, nonatomic) IBOutlet UIImageView *gameIcon1;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle2;
@property (weak, nonatomic) IBOutlet UIImageView *gameIcon2;
@property (weak, nonatomic) IBOutlet UIImageView *gameIcon3;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle3;
@property (weak, nonatomic) IBOutlet UIImageView *gameIcon4;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle4;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property(nonatomic,weak) id<RecommandCell_1Delegate> delegate;
@property(nonatomic,assign)groupType type;
@end
@implementation RecommandCell_1


+(NSString*) CellID
{
    return @"RecommandCell_1";
}

+(instancetype) loadCell1ByXib:(UITableView *)tableView
{
    RecommandCell_1 * cell1 =   [tableView dequeueReusableCellWithIdentifier:[self CellID]];
    if (cell1 == nil) {
        cell1 = [[NSBundle mainBundle] loadNibNamed:@"RecommandCell_1" owner:nil options:nil][0];
    }else{
        XkyLog(@"服用");
    }
    return cell1;
}

- (void)awakeFromNib {
    // Initialization code
}

-(void) setGameIconTitles:(NSString *)iconPath title:(NSString *)title
{
//    [_gameView1 setIconAndTitle:iconPath title:title];
}
/**
 *  这里固定四个
 *
 *  @param games <#games description#>
 */
-(void) setGameData:(SpecialGroupitem*) games
{
    NSArray *items =  games.itemData;
    if (!items || items.count<4) {
        return;
    }
    Game *g1 =  items[0];
    Game *g2 =  items[1];
    Game *g3 =  items[2];
    Game *g4 =  items[3];
    [_gameTitle1 setText:g1.title];
    [_gameTitle2 setText:g2.title];
    [_gameTitle3 setText:g3.title];
    [_gameTitle4 setText:g4.title];
    [_gameIcon1 sd_setImageWithURL:[NSURL URLWithString:[NSString getIconImgPath:g1.game_pic]] placeholderImage:[UIImage imageNamed:@"defulticon"]];
    [_gameIcon2 sd_setImageWithURL:[NSURL URLWithString:[NSString getIconImgPath:g2.game_pic]] placeholderImage:[UIImage imageNamed:@"defulticon"]];
    [_gameIcon3 sd_setImageWithURL:[NSURL URLWithString:[NSString getIconImgPath:g3.game_pic]] placeholderImage:[UIImage imageNamed:@"defulticon"]];
    [_gameIcon4 sd_setImageWithURL:[NSURL URLWithString:[NSString getIconImgPath:g4.game_pic]] placeholderImage:[UIImage imageNamed:@"defulticon"]];
    
    [self setClickGameView:_gameContainer1 Game:g1];
     [self setClickGameView:_gameContainer2 Game:g2];
     [self setClickGameView:_gameContainer3 Game:g3];
     [self setClickGameView:_gameContainer4 Game:g4];
}

-(void) showBottomView:(BOOL) isShow
{
    _bottomView.hidden = !isShow;
}

-(void)setGameGroupDelegate:(groupType)groupType delegate:(id<RecommandCell_1Delegate>)delegate
{
    _type = groupType;
    _delegate = delegate;
    [self setClickBottomView];
}


-(void) setClickGameView:(UIView*)container Game:(Game*) game
{
    TapGestureRecognizerParam *tagGetster = [[TapGestureRecognizerParam alloc]initWithTarget:self action:@selector(clickGameItem:)];
    tagGetster.param = game;
    [container addGestureRecognizer:tagGetster];
}

-(void) clickGameItem:(TapGestureRecognizerParam*) getster
{
    if ([_delegate respondsToSelector:@selector(clickgame:)]) {
        [_delegate clickgame:getster.param];
    }
}

-(void) setClickBottomView
{
    TapGestureRecognizerParam *tagGetster = [[TapGestureRecognizerParam alloc]initWithTarget:self action:@selector(clickBottom:)];
    [_bottomView addGestureRecognizer:tagGetster];
}

-(void) clickBottom:(TapGestureRecognizerParam*) getster
{
    if ([_delegate respondsToSelector:@selector(clickBottom:)]) {
        [_delegate clickBottom:_type];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
