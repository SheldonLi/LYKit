//
//  LYPasswordTextField.m
//  uworks-library
//
//  Created by SheldonLee on 15/10/8.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import "LYPasswordTextField.h"

@interface LYPasswordTextField ()
@property (nonatomic, copy) NSString *password;
@property (nonatomic, weak) id beginEditingObserver;
@property (nonatomic, weak) id endEditingObserver;
@end

@implementation LYPasswordTextField

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self passwordtextFieldCommonInit];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self passwordtextFieldCommonInit];
    }
    return self;
}

- (void)passwordtextFieldCommonInit {

    self.password = @"";

    __weak LYPasswordTextField *weakSelf = self;

    self.beginEditingObserver = [[NSNotificationCenter defaultCenter]
        addObserverForName:UITextFieldTextDidBeginEditingNotification
                    object:nil
                     queue:nil
                usingBlock:^(NSNotification *note) {
                    if (weakSelf == note.object && weakSelf.isSecureTextEntry) {
                        weakSelf.text = @"";
                        [weakSelf insertText:weakSelf.password];
                    }
                }];
    self.endEditingObserver = [[NSNotificationCenter defaultCenter]
        addObserverForName:UITextFieldTextDidEndEditingNotification
                    object:nil
                     queue:nil
                usingBlock:^(NSNotification *note) {
                    if (weakSelf == note.object) {
                        weakSelf.password = weakSelf.text;
                    }
                }];
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    BOOL isFirstResponder = self.isFirstResponder;
    [self resignFirstResponder];
    [super setSecureTextEntry:secureTextEntry];
    if (isFirstResponder) {
        [self becomeFirstResponder];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self.beginEditingObserver];
    [[NSNotificationCenter defaultCenter] removeObserver:self.endEditingObserver];
}

@end
