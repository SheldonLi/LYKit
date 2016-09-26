//
//  UWCenterViewController.h
//  uworks-library
//
//  Created by SheldonLee on 15/12/14.
//  Copyright © 2015年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWCenterViewController : UIViewController

/**
 *  增加左边按钮
 */
- (void)addLeftMenuButtonWithFrame:(CGRect)frame
                       normalImage:(UIImage *__nullable)normalImage
                    highlightImage:(UIImage *__nullable)highlightImage;

/**
 *  增加右边按钮
 */
- (void)addRightMenuButtonWithFrame:(CGRect)frame
                        normalImage:(UIImage *__nullable)normalImage
                     highlightImage:(UIImage *__nullable)highlightImage;

@end
