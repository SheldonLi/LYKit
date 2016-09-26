//
//  UWTextView.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/13.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "UWTextView.h"

@interface UWTextView ()<UITextViewDelegate> {
    UILabel *_placeholderLabel;
}

@end

@implementation UWTextView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(DidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];

    float left = 5, top = 2, hegiht = 30;

    self.placeholderColor = [UIColor lightGrayColor];
    _placeholderLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(left, top, CGRectGetWidth(self.frame) - 2 * left, hegiht)];
    _placeholderLabel.font = self.placeholderFont ? self.placeholderFont : self.font;
    _placeholderLabel.textColor = self.placeholderColor;
    [self addSubview:_placeholderLabel];
    _placeholderLabel.text = self.placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    if (placeholder.length == 0 || [placeholder isEqualToString:@""]) {
        _placeholderLabel.hidden = YES;
    } else
        _placeholderLabel.text = placeholder;
    _placeholder = placeholder;
}

- (void)DidChange:(NSNotification *)noti {
    if (self.placeholder.length == 0 || [self.placeholder isEqualToString:@""]) {
        _placeholderLabel.hidden = YES;
    }

    if (self.text.length > 0) {
        _placeholderLabel.hidden = YES;
    } else {
        _placeholderLabel.hidden = NO;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_placeholderLabel removeFromSuperview];
}

@end
