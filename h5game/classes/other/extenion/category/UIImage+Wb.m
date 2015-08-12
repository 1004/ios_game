//
//  UIImage+Wb.m
//  WeiBo
//
//  Created by xky on 15/7/7.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import "UIImage+Wb.h"

@implementation UIImage (Wb)
+(UIImage *)imageNamedByCustom:(NSString *)name
{
//    if (ios7) {
//        NSString * fname = [name stringByAppendingString:@"_os7"];
//        UIImage * img = [UIImage imageNamed:fname];
//        if (img != nil) {
//            return img;
//        }else{
//            return [UIImage imageNamed:name];
//        }
//    }
    return [UIImage imageNamed:name];
}

+(UIImage *) stretchImgByCustom:(NSString *) name
{
    UIImage * img = [UIImage imageNamedByCustom:name];
   return  [img stretchableImageWithLeftCapWidth:img.size.width*0.5 topCapHeight:img.size.height*0.5];
}

+(UIImage *) stretchImgByCustom:(NSString *) name scale_w:(CGFloat) scalew scale_h:(CGFloat) scaleh
{
    UIImage * img = [UIImage imageNamedByCustom:name];
    return  [img stretchableImageWithLeftCapWidth:img.size.width*scalew topCapHeight:img.size.height*scaleh];
}



@end
