//
//  HLZipConfigured.m
//  www
//
//  Created by jidao on 16/7/6.
//  Copyright © 2016年 黄磊. All rights reserved.
//

#import "HLZipConfigured.h"

@implementation HLZipConfigured

+ (HLZipConfigured *)defaultConfigure
{
    static HLZipConfigured *configureObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      configureObj = [[HLZipConfigured alloc] init];
                  });
    
    return configureObj;
}

- (id)init
{
    self = [super init];
    
    _nThemeIndex = [[[NSUserDefaults standardUserDefaults] objectForKey:kTHEME_TAG] integerValue];
    _themefold = [[NSUserDefaults standardUserDefaults] objectForKey:kTHEMEFOLD_TAG];
    
    return self;
}

- (void)setNThemeIndex:(int)nThemeIndex
{
    _nThemeIndex = nThemeIndex;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:nThemeIndex] forKey:kTHEME_TAG];
}

- (void)setThemefold:(NSString *)themefold
{
    _themefold = themefold;
    [[NSUserDefaults standardUserDefaults] setObject:_themefold forKey:kTHEMEFOLD_TAG];
}

@end
