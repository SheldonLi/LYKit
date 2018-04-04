//
//  UIView+FrameTool.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//
//  快速获取view的frame属性

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (FrameTool)

@property (readonly) CGPoint ly_bottomLeft;
@property (readonly) CGPoint ly_bottomRight;
@property (readonly) CGPoint ly_topRight;


@property (nonatomic, assign) CGFloat ly_top;
@property (nonatomic, assign) CGFloat ly_left;

@property (nonatomic, assign) CGFloat ly_bottom;
@property (nonatomic, assign) CGFloat ly_right;

@property (nonatomic, assign) CGFloat ly_x;
@property (nonatomic, assign) CGFloat ly_y;
@property (nonatomic, assign) CGFloat ly_width;
@property (nonatomic, assign) CGFloat ly_height;
@property (nonatomic, assign) CGFloat ly_centerX;
@property (nonatomic, assign) CGFloat ly_centerY;
@property (nonatomic, assign) CGSize ly_size;
@property (nonatomic, assign) CGPoint ly_origin;



+ (CGFloat)ly_screenWidth;

+ (CGFloat)ly_screenHeight;

+ (CGFloat)ly_scale;

- (void)moveBy:(CGPoint)delta;
- (void)scaleBy:(CGFloat)scaleFactor;
- (void)fitInSize:(CGSize)aSize;


@end
