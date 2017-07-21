//
//  UIImage+Luban_iOS_Extension_h.h
//  Luban-iOS
//
//  Created by guo on 2017/7/20.
//  Copyright © 2017年 guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Luban_iOS_Extension_h)

+ (UIImage *)lubanCompressImage:(UIImage *)image;
+ (UIImage *)lubanCompressImage:(UIImage *)image withMask:(NSString *)maskName;

@end
