//
//  UIImage+Wb.h
//  WeiBo
//
//  Created by xky on 15/7/7.
//  Copyright (c) 2015年 xky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Wb)
+(UIImage *) imageNamedByCustom:(NSString *) name;
+(UIImage *) stretchImgByCustom:(NSString *) name;
+(UIImage *) stretchImgByCustom:(NSString *) name scale_w:(CGFloat) scalew scale_h:(CGFloat) scaleh;

@end
