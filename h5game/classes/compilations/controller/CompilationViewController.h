//
//  CompilationViewController.h
//  h5game
//
//  Created by xky on 15/8/8.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
@protocol HeaderViewPagerDelegate;
@interface CompilationViewController : BaseTableViewController<HeaderViewPagerDelegate>
@property(nonatomic,weak) UIViewController *mainController;
@end
