//
//  ColorAndFontHeader.h
//  toolstest
//
//  Created by SheldonLee on 15/8/26.
//  Copyright (c) 2015年 U-Works. All rights reserved.
//

#ifndef LYKit_ColorAndFontHeader_h
#define LYKit_ColorAndFontHeader_h

// 颜色定义
#define HEXCOLOR(rgbValue)                                               \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
                     blue:((float)(rgbValue & 0xFF)) / 255.0             \
                    alpha:1.0]

#define RGBCOLOR(r, g, b) \
    [UIColor colorWithRed:r % 256 / 255.0 green:g % 256 / 255.0 blue:b % 256 / 255.0 alpha:1]
#define RGBACOLOR(r, g, b, a) \
    [UIColor colorWithRed:r % 256 / 255.0 green:g % 256 / 255.0 blue:b % 256 / 255.0 alpha:a]

// 主蓝色
#define COLOR_BASE_BLUE HEXCOLOR(0x0078FF)
// 主背景灰
#define COLOR_BASE_GRAY HEXCOLOR(0xE5E5E5)
// 字体黑
#define COLOR_BASE_TEXT_BLACK HEXCOLOR(0x333333)
// 字体灰
#define COLOR_BASE_TEXT_GRAY HEXCOLOR(0x999999)
// 字体黄
#define COLOR_BASE_TEXT_YELLOW HEXCOLOR(0xFCC55A)
// 导航栏上未选中时
#define COLOR_BASE_NAV HEXCOLOR(0xBBFBC3)
// 登录页高亮边框
#define COLOR_BASE_TEXTFIELD_BORDER HEXCOLOR(0x71B4FE)
//已关注按钮颜色
#define COLOR_BASE_DARK_BLUE HEXCOLOR(0x04269A)
//提示字体颜色
#define COLOR_BASE_LIGHT_GRAY HEXCOLOR(0x898989)
//文本框边框颜色
#define COLOR_BORDER HEXCOLOR(0x71b4fe)
// placeholder字体颜色
#define COLOR_PLACEHOLDER HEXCOLOR(0xc5c5c5)

// 字体定义
#define SYSTEM_FONT(fontSize) [UIFont systemFontOfSize:fontSize]
#define SYSTEM_BOLD_FONT(fontSize) [UIFont boldSystemFontOfSize:fontSize]

// 快速的titleAttribute字典的创建
#define DICT_ATTRIBUTE_TITLE(_font, _hexcolor)                \
    @{                                                        \
       NSFontAttributeName : [UIFont systemFontOfSize:_font], \
       NSForegroundColorAttributeName : HEXCOLOR(_hexcolor),  \
    }

#define DICT_ATTRIBUTE_TITLE_BOLD(_font, _hexcolor)               \
    @{                                                            \
       NSFontAttributeName : [UIFont boldSystemFontOfSize:_font], \
       NSForegroundColorAttributeName : HEXCOLOR(_hexcolor),      \
    }

#endif
