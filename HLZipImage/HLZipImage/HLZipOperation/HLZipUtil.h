//
//  HLZipUtil.h
//  www
//
//  Created by jidao on 16/7/6.
//  Copyright © 2016年 黄磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface HLZipUtil : NSObject
//将view转为image
+ (UIImage *)getImageFromView:(UIView *)view;

//获取随机颜色color
+ (UIColor *)getRandomColor;

//根据比例（0...1）在min和max中取值
+ (float)lerp:(float)percent min:(float)nMin max:(float)nMax;

+ (void)unzipFileToDocument:(NSString *)fileName;

+ (void)moveFileToDocument:(NSString *)fileName type:(NSString *)fileType;

+ (UIImage *)imageNamed:(NSString *)name;
@end
