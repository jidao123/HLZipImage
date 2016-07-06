//
//  HLZipUtil.m
//  www
//
//  Created by jidao on 16/7/6.
//  Copyright © 2016年 黄磊. All rights reserved.
//

#import "HLZipUtil.h"
#import "HLZipConfigured.h"
#import "SSZipArchive.h"

@implementation HLZipUtil
+ (UIImage *)getImageFromView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIColor *)getRandomColor
{
    return [UIColor colorWithRed:(float)(1+arc4random()%99)/100 green:(float)(1+arc4random()%99)/100 blue:(float)(1+arc4random()%99)/100 alpha:1];
}

/*0--1 : lerp( float percent, float x, float y ){ return x + ( percent * ( y - x ) ); };*/
+ (float)lerp:(float)percent min:(float)nMin max:(float)nMax
{
    float result = nMin;
    
    result = nMin + percent * (nMax - nMin);
    
    return result;
}

+ (void)unzipFileToDocument:(NSString *)fileName
{
    [HLZipUtil moveFileToDocument:fileName type:@"zip"];
}

+ (void)moveFileToDocument:(NSString *)fileName type:(NSString *)fileType
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath2 = [documentsDirectory stringByAppendingPathComponent:[fileName stringByAppendingPathExtension:fileType]];
    NSString *pathFold = [filePath2 stringByDeletingPathExtension];
    NSString *path = [filePath2 stringByDeletingLastPathComponent];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    

    if (![manager fileExistsAtPath:pathFold])
    {
        
        NSError *thiserror = nil;
        if ([[NSFileManager defaultManager] copyItemAtPath:filePath toPath:filePath2 error:&thiserror] != YES)
        {
            NSLog(@"move fail...");
            NSLog(@"Unable to move file: %@", [thiserror localizedDescription]);
        }else{
            
        }
        

        BOOL ret = [SSZipArchive unzipFileAtPath:filePath2 toDestination:path];
        if (NO == ret)
        {
            NSLog(@"fail");
        }
        

        [manager removeItemAtPath:filePath2 error:nil];
        NSError * err;
        BOOL isDelete = [manager removeItemAtPath:filePath error:&err];
        
        if (isDelete) {
            
        }
    }else
    {
        //        [manager removeItemAtPath:filePath2 error:nil];
    }
}

+ (UIImage *)imageNamed:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    UIImage *image = nil;
    if ([HLZipConfigured defaultConfigure].themefold != nil && [HLZipConfigured defaultConfigure].themefold.length > 0)
    {
        NSString *path = [[documentsDirectory stringByAppendingPathComponent:[HLZipConfigured defaultConfigure].themefold] stringByAppendingPathComponent:name];
        image = [UIImage imageWithContentsOfFile:path];
    }
    if (image == nil)
    {
        image = [UIImage imageNamed:name];
    }
    
    return image;
}
@end
