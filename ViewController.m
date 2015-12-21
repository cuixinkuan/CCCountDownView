//
//  ViewController.m
//  CCCountDownView
//
//  Created by admin on 15/12/21.
//  Copyright © 2015年 CXK. All rights reserved.
//

#import "ViewController.h"
#import "CCCountDown.h"

#define SCREEN_WIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 150)/2, 200, 150, 30)];
    titleLabel.layer.masksToBounds = YES;
    titleLabel.layer.cornerRadius = 15;
    titleLabel.backgroundColor = [UIColor orangeColor];
    titleLabel.text = @"简单的倒计时";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor redColor];
    [self.view addSubview:titleLabel];
    
    CCCountDown * countDown = [CCCountDown shareCountDown];
    countDown.frame = CGRectMake((SCREEN_WIDTH - 200)/2, 100, 200, 30);
    countDown.timestamp = 60 * 60 * 24 * 5;
    countDown.backgroundColor = [UIColor grayColor];
//    countDown.backgroundImagename = @"timerbackimage1";
    
    countDown.timerStopBlock = ^{
        NSLog(@"----------> stop timer and do something");
    };
    [self.view addSubview:countDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
