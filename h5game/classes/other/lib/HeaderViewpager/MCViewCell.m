//
//  MCViewCell.m
//  h5game
//
//  Created by xky on 15/8/7.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "MCViewCell.h"
@interface MCViewCell()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
@implementation MCViewCell

-(void)awakeFromNib
{
//    XkyLog(@"MCViewCell.h--awakeFromNib---");
}

-(void)setTestTag:(NSString *)testTag
{
    _testLabel.text = testTag;
}

-(void) addContentView:(UIView *)contentView
{
    if (self.subviews.count) {
        for (int i = 0; i<self.subviews.count; i++) {
            [self.subviews[i] removeFromSuperview];
        }
    }
    [self addSubview:contentView];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *consH =   [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentView]-0-|" options:0 metrics:nil views:@{@"contentView":contentView}];
     NSArray *consV =   [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentView]-0-|" options:0 metrics:nil views:@{@"contentView":contentView}];
    [self addConstraints:consH];
    [self addConstraints:consV];
}

@end
