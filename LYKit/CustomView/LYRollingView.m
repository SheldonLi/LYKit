//
//  LYRollingView.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/20.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "LYRollingView.h"

@interface LYRollingView () {
    UILabel *_label;
    UIButton *_button;
    NSTimer *_timer;
    NSArray *_infoStringArray;
    NSArray *_infoImageArray;
    NSInteger _infoCount;
}
@end

@implementation LYRollingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setInfoStringsArray:(NSArray *)array andRollDuration:(CGFloat)seconds {
    _label = [[UILabel alloc]
        initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_label];
    if (self.labelBackgroundColor) {
        _label.backgroundColor = self.labelBackgroundColor;
    } else {
        _label.backgroundColor = [UIColor lightGrayColor];
    }
    _label.textAlignment = NSTextAlignmentCenter;

    if (array.count != 0) {
        _infoStringArray = array;
        _label.text = array[0];
        _infoCount = 0;
        [self beginTimerWithDuration:seconds];

    } else {
        _label.text = @"";
    }
}

- (void)setInfoStringsArray:(NSArray *)stringArray infoImageArrays:(NSArray *)imageArray andRollDuration:(CGFloat)seconds {
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_button];
    
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if (self.labelBackgroundColor) {
        _button.backgroundColor = self.labelBackgroundColor;
    } else {
        _button.backgroundColor = [UIColor lightGrayColor];
    }
    _button.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    if (MIN(stringArray.count, imageArray.count) != 0) {
        _infoStringArray = stringArray;
        _infoImageArray = imageArray;
        [_button setTitle:stringArray[0] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:imageArray[0]] forState:UIControlStateNormal];
        _infoCount = 0;
        [self beginTimerWithDuration:seconds];
        
    } else {
        _label.text = @"";
    }
    
}

#pragma mark - 开始计时器
- (void)beginTimerWithDuration:(CGFloat)timerDuration {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:timerDuration
                                                  target:self
                                                selector:@selector(timerFire)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)timerFire {

    if (_label) {
        [self fadeLayer:_label.layer];
    } else if (_button) {
        [self fadeLayer:_button.layer];
    }

    _infoCount++;
    if (_infoCount == _infoStringArray.count) {
        _infoCount = 0;
    }
    if (_label) {
        _label.text = _infoStringArray[_infoCount];
    } else if (_button) {
        [_button setTitle:_infoStringArray[_infoCount] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:_infoImageArray[_infoCount]] forState:UIControlStateNormal];
    }
    
}

#pragma mark - 停止计时器并移除
- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

- (void)fadeLayer:(CALayer *)layer {
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    switch (self.RollAnimationType) {
        case LYRollViewAnimationTypeCube:
            animation.type = @"cube";
            break;
        case LYRollViewAnimationTypePush:
            animation.type = kCATransitionPush;
            break;
        case LYRollViewAnimationTypeReveal:
            animation.type = kCATransitionReveal;
            break;
        case LYRollViewAnimationTypeMoveIn:
            animation.type = kCATransitionMoveIn;
            break;
        case LYRollViewAnimationTypeFade:
            animation.type = kCATransitionFade;
            break;
            
        default:
            animation.type = kCATransitionMoveIn;
            break;
    }
    
    switch (self.RollDirection) {
        case LYRollViewDirectionFromUp:
            animation.subtype = kCATransitionFromBottom;
            break;
        case LYRollViewDirectionFromLeft:
            animation.subtype = kCATransitionFromLeft;
            break;
        case LYRollViewDirectionFromDown:
            animation.subtype = kCATransitionFromTop;
            break;
        case LYRollViewDirectionFromRight:
            animation.subtype = kCATransitionFromRight;
            break;
            
        default:
            animation.subtype = kCATransitionFromTop;
            break;
    }

    [layer addAnimation:animation forKey:@"animation"];
}

@end
