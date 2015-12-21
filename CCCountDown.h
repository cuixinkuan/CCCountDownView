//
//  CCCountDown.h
//  CCCountDownView
//
//  Created by admin on 15/12/21.
//  Copyright © 2015年 CXK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TimerStopBlock)();

@interface CCCountDown : UIView
/**
 *  timeStamp
 */
@property (nonatomic,assign)NSInteger timestamp;
/**
 *  backgroundimage
 */
@property (nonatomic,copy)NSString * backgroundImagename;
/**
 *  block when the timestamp finished
 */
@property (nonatomic,copy)TimerStopBlock timerStopBlock;
/**
 *  create an instance
 */
+ (instancetype)shareCountDown;
/**
 *  create an uninstance
 */
+ (instancetype)countDown;




@end
