//
//  Compilation_D_Controller.h
//  h5game
//
//  Created by xky on 15/8/12.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "BaseTableViewController.h"
typedef enum{
    ONLINE,
    RECOMMAND
}DetailType;
@interface Compilation_D_Controller : BaseTableViewController
@property(nonatomic,assign)DetailType type;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString *d_Id;
@end
