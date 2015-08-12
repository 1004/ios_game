//
//  RecommandHeaderView.m
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "RecommandHeaderView.h"
@interface RecommandHeaderView()
@property (weak, nonatomic) IBOutlet UILabel *headTitle;

@end

@implementation RecommandHeaderView

+(instancetype) loadXibView
{
   return  [[NSBundle mainBundle] loadNibNamed:@"R_Header" owner:nil  options:nil][0];
}

-(void) headTitle:(NSString *)headTitle
{
    [_headTitle setText:headTitle];
}

@end
