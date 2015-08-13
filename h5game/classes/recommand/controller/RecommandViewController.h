//
//  RecommandViewController.h
//  h5game
// 推荐
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@protocol HeaderViewPagerDelegate;
@interface RecommandViewController : BaseViewController<HeaderViewPagerDelegate>
@property(nonatomic,weak)UIViewController *mainViewController;
@end
