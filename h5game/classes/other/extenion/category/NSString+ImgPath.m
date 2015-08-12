//
//  NSString+ImgPath.m
//  h5game
//
//  Created by xky on 15/8/11.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "NSString+ImgPath.h"

@implementation NSString (ImgPath)
+(NSString *) getIconImgPath:(NSString*)path
{
 return    [path stringByAppendingString:@".jpg"];
}
@end
