//
//  CCCountDown.m
//  CCCountDownView
//
//  Created by admin on 15/12/21.
//  Copyright © 2015年 CXK. All rights reserved.
//

#import "CCCountDown.h"

#define labelcount 4
#define separateLabelcount 3
#define padding 5

@interface CCCountDown  ()
{
    //timer
    NSTimer * timer;
}
@property (nonatomic,strong)NSMutableArray * timeLabelArr;
@property (nonatomic,strong)NSMutableArray * separateLabelArr;
// day
@property (nonatomic,strong)UILabel * dayLabel;
// hour
@property (nonatomic,strong)UILabel * hourLabel;
// minues
@property (nonatomic,strong)UILabel * minuesLabel;
// seconds
@property (nonatomic,strong)UILabel * secondsLabel;

@end

@implementation CCCountDown
+ (instancetype)shareCountDown {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        instance = [[CCCountDown alloc] init];
    });
    return instance;
}

+ (instancetype)countDown {
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.dayLabel];
        [self addSubview:self.hourLabel];
        [self addSubview:self.minuesLabel];
        [self addSubview:self.secondsLabel];
        
        for (NSInteger i = 0 ; i < separateLabelcount; i ++ ) {
            UILabel * separateLabel = [[UILabel alloc] init];
            separateLabel.text = @":";
            separateLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:separateLabel];
            [self.separateLabelArr addObject:separateLabel];
        }
    }
    return self;
}

- (void)setBackgroundImagename:(NSString *)backgroundImagename {
    _backgroundImagename = backgroundImagename;
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImagename]];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
}
// have had the timestamp.
- (void)setTimestamp:(NSInteger)timestamp {
    _timestamp = timestamp;
    if (_timestamp != 0 ) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}

- (void)timer:(NSTimer *)timer0 {
    _timestamp -- ;
    [self createDetailTimeWithTimestamp:_timestamp];
    if (_timestamp == 0 ) {
        [timer invalidate];// close timer.
        timer = nil;
        self.timerStopBlock();// invoke block.
    }
}

- (void)createDetailTimeWithTimestamp:(NSInteger)timestamp {
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    //  residued time
    NSInteger day = ms / dd;
    NSInteger hour = (ms - day * dd) / hh;
    NSInteger minute = (ms - day * dd - hour * hh) / mi;
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;
    
    self.dayLabel.text = [NSString stringWithFormat:@"%zd 天",day];
    self.hourLabel.text = [NSString stringWithFormat:@"%zd 时",hour];
    self.minuesLabel.text = [NSString stringWithFormat:@"%zd 分",minute];
    self.secondsLabel.text = [NSString stringWithFormat:@"%zd 秒",second];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    CGFloat labelW = viewWidth / labelcount;
    CGFloat labelH = viewHeight;
    self.dayLabel.frame = CGRectMake(0, 0, labelW, labelH);
    self.hourLabel.frame = CGRectMake(labelW, 0, labelW, labelH);
    self.minuesLabel.frame = CGRectMake(labelW * 2, 0, labelW, labelH);
    self.secondsLabel.frame = CGRectMake(labelW * 3, 0, labelW, labelH);
    
    for (NSInteger index = 0; index < self.separateLabelArr.count; index ++ ) {
        UILabel * separateLabel = self.separateLabelArr[index];
        separateLabel.frame = CGRectMake((index + 1) * (labelW - 1), 0, 5, labelH);
    }
}

#pragma  mark - Setter & Getter -

- (NSMutableArray *)timeLabelArr {
    if (_timeLabelArr == nil) {
        _timeLabelArr = [[NSMutableArray alloc] init];
    }
    return _timeLabelArr;
}

- (NSMutableArray *)separateLabelArr {
    if (_separateLabelArr == nil) {
        _separateLabelArr = [[NSMutableArray alloc] init];
    }
    return _separateLabelArr;
}

- (UILabel *)dayLabel {
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dayLabel;
}

- (UILabel *)hourLabel {
    if (_hourLabel == nil) {
        _hourLabel = [[UILabel alloc] init];
        _hourLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hourLabel;
}

- (UILabel *)minuesLabel {
    if (_minuesLabel == nil) {
        _minuesLabel = [[UILabel alloc] init];
        _minuesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _minuesLabel;
}

- (UILabel *)secondsLabel {
    if (_secondsLabel == nil) {
        _secondsLabel = [[UILabel alloc] init];
        _secondsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _secondsLabel;
}














































@end
