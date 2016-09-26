//
//  LYTextAnimationView.m
//  uworks-library
//
//  Created by SheldonLee on 12/12/15.
//  Copyright © 2015 Sheldon. All rights reserved.
//

#import "LYTextAnimationView.h"

@interface LYTextAnimationView()

@property (nonatomic, assign) NSTimer *time;

@property (nonatomic, copy) NSString *drawString;

@end

@implementation LYTextAnimationView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self animationText];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self animationText];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self animationText];
    }
    return self;
}

- (void)animationText {
    _time = [NSTimer scheduledTimerWithTimeInterval:0.2
                                             target:self
                                           selector:@selector(startAnimation)
                                           userInfo:nil
                                            repeats:NO];
}

- (void)drawRect:(CGRect)rect {
    
    [self drawString:_drawString withPoint:CGPointMake(10, 10)];
}

- (void)drawString:(NSString *)text withPoint:(CGPoint)point {
    UIFont *font = _textFont;
    UIColor *textColor = _textColor;
    
    NSDictionary *dic = @{NSFontAttributeName : font, NSForegroundColorAttributeName : textColor};
    [text drawAtPoint:point withAttributes:dic];
}

- (void)startAnimation {
    static int i = 1;
    if (i == _text.length + 1) {
        [_time invalidate];
        _time = nil;
        return;
    }
    _drawString = [_text substringWithRange:NSMakeRange(0, i)];
    i++;
    [self setNeedsDisplay];
    [self animationText];
}

@end
