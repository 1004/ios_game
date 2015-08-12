//
//  DefaultOperate.h
//  h5game
//
//  Created by xky on 15/8/6.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DefaultOperate <NSObject>
@optional
-(void) initDefaultView;
@optional
-(void) initDefaultData;
@optional
-(void)initDefaultDelegate;
@optional
-(void)loadData;
@end
