//
//  ViewController.m
//  HLZipImage
//
//  Created by jidao on 16/7/6.
//  Copyright © 2016年 iOS轰炸机. All rights reserved.
//

#import "ViewController.h"
#import "HLZipUtil.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 50, 40)];
    image.image = [HLZipUtil imageNamed:@"lllttt.jpg"];
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
