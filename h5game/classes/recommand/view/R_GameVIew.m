//
//  R_GameVIew.m
//  h5game
//
//  Created by xky on 15/8/9.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "R_GameVIew.h"
#import "DefaultOperate.h"
@interface R_GameVIew()<DefaultOperate>
@property(nonatomic,weak) UIImageView*iconView;
@property(nonatomic,weak)UILabel*titleView;
@end
@implementation R_GameVIew
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
- (void)awakeFromNib
{
    [self executeOperate];
}

-(void) executeOperate
{
    [self initDefaultView];
    [self initDefaultData];
    [self initDefaultDelegate];
}

- (void)initDefaultView
{
    UIImageView *iconView = [[UIImageView alloc]init];
    UILabel *titleView = [[UILabel alloc]init];
    [self addSubview:iconView];
    [self addSubview:titleView];
    _iconView = iconView;
    _titleView = titleView;
    _iconView.translatesAutoresizingMaskIntoConstraints = NO;
    _titleView.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void)initDefaultData
{
  NSArray *iconWConts =   [NSLayoutConstraint constraintsWithVisualFormat:@"H:[iconView(iconW)]" options:0 metrics:@{@"iconW":@(ICONWH)} views:@{@"iconView":_iconView}];
    [self addConstraints:iconWConts];
    NSArray *iconHConts =   [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-marginTop-[iconView(iconH)]" options:0 metrics:@{@"iconH":@(ICONWH),@"marginTop":@(ICONMAEGINTOP)} views:@{@"iconView":_iconView}];
   NSLayoutConstraint *iconHCont =  [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraints:iconWConts];
    [self addConstraints:iconHConts];
    [self addConstraint:iconHCont];
    
   NSArray* titleWConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[titleView]-0-|" options:0 metrics:nil views:@{@"titleView":_titleView}];
   NSArray* titleHConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[iconView]-margin-[titleView]" options:0 metrics:@{@"margin":@(RTITLEMARGIN)} views:@{@"iconView":_iconView,@"titleView":_titleView}];
    [self addConstraints:titleWConts];
    [self addConstraints:titleHConts];
}

-(void) setIconAndTitle:(NSString*)iconPath title:(NSString*)title
{
    _titleView.text = title;
}


-(void)initDefaultDelegate
{
    
}


@end
