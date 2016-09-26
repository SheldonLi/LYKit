//
//  UWTextField.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/8.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "UWTextField.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface UWTextField()

@property(nonatomic, assign) BOOL enableLimitCount;

@end

@implementation UWTextField

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";



- (instancetype)init {
    self = [super init];
    if (self) {
        [self textFieldCommonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self textFieldCommonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self textFieldCommonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                  cornerRadio:(CGFloat)radio
                  borderWidth:(CGFloat)bWidth
            borderNormalColor:(UIColor *)bNormalColor
             borderLightColor:(UIColor *)bLightColor {
    self = [self initWithFrame:frame];
    if (self) {
        _borderNormalColor = bNormalColor;
        _borderLightColor = bLightColor;
        _cornerRadio = radio;
        _borderWidth = bWidth;

        [self.layer setCornerRadius:_cornerRadio];
        [self.layer setBorderColor:_borderNormalColor.CGColor];
        [self.layer setBorderWidth:_borderWidth];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setMasksToBounds:NO];
    }
    return self;
}

- (void)textFieldCommonInit {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(endEditing:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:self];
}

- (void)beginEditing:(NSNotification *)notification {
//    [[self layer] setShadowOffset:CGSizeMake(0, 0)];
//    [[self layer] setShadowRadius:_lightSize];
//    [[self layer] setShadowOpacity:1];
//    [[self layer] setShadowColor:_lightColor.CGColor];
    [self.layer setBorderColor:_borderLightColor.CGColor];
}

- (BOOL)endEditing:(BOOL)force {
//    [[self layer] setShadowOffset:CGSizeZero];
//    [[self layer] setShadowRadius:0];
//    [[self layer] setShadowOpacity:0];
//    [[self layer] setShadowColor:nil];
    [self.layer setBorderColor:_borderNormalColor.CGColor];
    return YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio * 2, bounds.origin.y,
                              bounds.size.width - _cornerRadio * 2, bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio * 2, bounds.origin.y,
                              bounds.size.width - _cornerRadio * 2, bounds.size.height);
    return inset;
}



- (void)limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    if(self.text.length > length){
        self.text = [self.text substringToIndex:length];
    }
}


@end
