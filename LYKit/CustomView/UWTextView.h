//
//  UWTextView.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/13.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWTextView : UITextView

@property(copy, nonatomic) NSString *placeholder;
@property(strong, nonatomic) UIColor *placeholderColor;
@property(strong, nonatomic) UIFont *placeholderFont;

@end
