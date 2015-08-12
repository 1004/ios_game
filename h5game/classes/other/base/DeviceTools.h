//
//  DeviceTools.h
//  h5game
//
//  Created by xky on 15/8/10.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceTools : NSObject
/**
 *  md5加密
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+(NSString *) md5HexDigest:(NSString *)str;

@end
