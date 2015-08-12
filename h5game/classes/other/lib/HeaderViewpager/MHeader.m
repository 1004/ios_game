//
//  MHeader.m
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MHeader.h"
#import "ViewPagerContants.h"
@interface MHeader()
{
    UIButton *_currentView;
}
@end
@implementation MHeader
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:XHeader_BgColor];
    }
    return self;
}


-(void)setHeadTitles:(NSArray *)headTitles
{
    _headTitles = headTitles;
    if (headTitles.count==0) {
        return;
    }
    for (int i = 0; i<headTitles.count; i++) {
         [self initHeaderTabByIndex:i];
    }
}

-(void) initHeaderTabByIndex:(int) index
{
    UIButton *tab = [UIButton buttonWithType:UIButtonTypeCustom];
    tab.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:tab];

   
    int tagW = SCREENW/_headTitles.count;
    int margntL = index*tagW;
   NSArray *tabWConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-marginL-[tab(tagW)]" options:0 metrics:@{@"marginL":@(margntL),@"tagW":@(tagW)} views:@{@"tab":tab}];
      NSArray *tabHConts =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tab]-0-|" options:0 metrics:nil views:@{@"tab":tab}];
    [self addConstraints:tabWConts];
    [self addConstraints:tabHConts];
    
    [tab setTitle:_headTitles[index] forState:UIControlStateNormal];
    [tab setTitleColor:XHEADER_NORMALCOLOR forState:UIControlStateNormal];
    [tab setTitleColor:XHEADER_HeightCOLOR forState:UIControlStateHighlighted];
    [tab setTitleColor:XHEADER_HeightCOLOR forState:UIControlStateDisabled];
    tab.tag = index;
    [tab addTarget:self action:@selector(clickTab:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) setCheckPosition:(int) position
{
    [self clickTab:self.subviews[position]];
}

-(void) clickTab:(UIButton*) tab
{
//    XkyLog(@"点击%ld",tab.tag);
    _currentView.enabled = YES;
    tab.enabled = NO;
    _currentView = tab;
    if ([_delegate respondsToSelector:@selector(click:index:)]) {
        [_delegate click:tab index:tab.tag];
    }
}



/**
 *  屏幕方向变换时候调用
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (UIDeviceOrientationIsPortrait(UIDeviceOrientationUnknown)) {
        XkyLog(@"--layoutSubviews 书评----");
    }
}




@end
