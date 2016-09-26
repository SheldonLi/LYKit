//
//  LYLogManager.h
//  yeoner
//
//  Created by SheldonLee on 16/7/10.
//  Copyright © 2016年 Sheldon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYLogManager : NSObject

+ (instancetype)shareManager;

- (void)saveLogToDocument;

@end
