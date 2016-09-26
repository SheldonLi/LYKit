//
//  SettingTool.h
//  uworks-library
//
//  Created by SheldonLee on 15/10/27.
//  Copyright © 2015年 U-Works. All rights reserved.
//
//  参考:iOS Xcode部署配置方案:http://www.cocoachina.com/ios/20151027/13916.html
//
//  目的：切换不同环境时，自动处理依赖环境的参数：若baseUrl地址，百度统计的key，融云key等等
//      只需要Scheme 的 Built Configuration 即可
//
//  总结:
//  1.最好在项目初始化时确定环境配置方案命名如下：
//        a.若有2个：使用默认的Debug和Release环境
//        b.若有3个：开发环境为Development，测试环境为Test，线上环境为Release
//        c.若有4个：开发环境为Development，测试环境为Test，演示环境为Verify，线上环境为Release
//          别问我超过4个怎么办，我也不知道
//    *注意：其他使用到环境的宏定义按相应初始化名字命名，比如 NSLog
//  2.为相应的环境分别创建配置plist文件，规范命名为Setting+环境名：如"Settings-Development.plist"
//  3.在相应环境的plist里面创建对应的key，注意每个plist对应键名相同，无特殊情况创建在Root Dictionary下
//  4.在Built Phasees的Copy Bundle Resources 移除所有setting.plist的引用
//  5.添加一个Run Script Build Phase，选择Editor -> Add Build Phase -> Add Run Script Build Phase。
//  6.添加脚本到新创建的Run Script (以3个环境为例，其他的应该会自己改吧o(╯□╰)o)     *注意：Settings-Development.plist等 绝对路径是否正确;
/*
            if [ "${CONFIGURATION}" == "Development" ]; then
            cp -r "${PROJECT_DIR}/Settings-Development.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Setting.plist"

            elif [ "${CONFIGURATION}" == "Test" ]; then
            cp -r "${PROJECT_DIR}/Settings-Test.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Setting.plist"
 
            elif [ "${CONFIGURATION}" == "Release" ]; then
            cp -r "${PROJECT_DIR}/Settings-Release.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Setting.plist"
 
            fi
*/
//  剩下的就是在SettingTool这个工具类的初始化，以及构建相应变量的获取方法
//        *注意：字典内的键名是否与plist对应

//    使用cocoaPod需要注意的问题问题，你需要到Project setting区域的info栏（和步骤1相同位置）,将所有新增配置的"Based on Configuration File" 设置为 "None"，然后运行"pod install"，强制pod工具为新创建的配置重新生成配置文件。同样如果后面你又添加了新的配置，你需要重复上面操作。


#import <Foundation/Foundation.h>

@interface SettingTool : NSObject

/**
 *  setting.plist Root的所有字典
 */
@property (nonatomic, copy) NSDictionary *settingDictionary;

+ (instancetype)shareTool;

/**
 *  获取baseUrl
 */
+ (NSString *)baseUrl;

@end
