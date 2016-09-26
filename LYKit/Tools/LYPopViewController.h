//
//  LYPopViewController.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/13.
//  Copyright © 2015年 U-Works. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^chooseCompleteBlock)(id);

@interface LYPopViewController : UIViewController

/**
 *  弹出的View
 */
@property (nonatomic, strong) UIView *mainPopView;

/** alpha */
@property (nonatomic, assign) CGFloat customAlpha;


/**  
 *  选中的View回调
 */
@property (nonatomic, copy) chooseCompleteBlock chooseCompleteBlock;


@end

