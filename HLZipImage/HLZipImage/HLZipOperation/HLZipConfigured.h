//
//  HLZipConfigured.h
//  www
//
//  Created by jidao on 16/7/6.
//  Copyright © 2016年 黄磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kTHEME_TAG @"selectTheme"
#define kTHEMEFOLD_TAG @"selectThemeFold"

@interface HLZipConfigured : NSObject
@property (nonatomic, assign) int nThemeIndex;
@property (nonatomic, retain) NSString *themefold;

+ (HLZipConfigured *)defaultConfigure;
@end
