##开发中一些有用的工具
###包括自定义的代码段、分类工具、自定义控件等

### 工程通过cocoapod管理
**目前使用到的框架有:**

* 'AFNetworking', '~> 3.1.0'
* 'SDWebImage', '~> 3.7.3'
* 'SVProgressHUD', '~> 1.1.3'
* 'FMDB', '~> 2.5'


#### LYCategory为常用类扩展
- **NSString+LYDateTool** 字符串的时间处理工具[(接口见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **NSString+Predicate** 字符串正则判断工具[(接口见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **NSString+LY** 字符串处理其他工具[(接口见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **UIImage+LY** 为UIImage的处理工具[(接口见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **UIView+FrameTool** 为UIView快速设置Frame的处理工具
- **UIButton+LY** 快速创建UIButton的工具
- **NSString+SandBox** 获取沙盒路径的工具
- **NSObject+LYArchive** 为自动归档与解档的分类[(说明及用法)](https://github.com/SheldonLi/LYKit/blob/master/LYKit/LYCategory/NSObject%2BLYArchive.h)
- **UIImage+LYMainBudleImage** 获取MainBudle里LaunchImage与IconImage的工具
- **NSObject+LYDescription** 在NSLog中或lldb的po命令时，自动打印model内的属性值，0代码实现，拖入工具即可使用

#### Tools为常用功能类
- **LYToast** 自定义弹出框控件[(接口见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **LYPopViewController** 为淡入淡出控制器，默认背景alpha为0.5，在屏幕中央出现[(用法见wiki)](https://github.com/SheldonLi/LYKit/wiki)
- **LYSetting** 一个Xcode部署配置方案工具
- **LYHealthKitTool** 封装HealthKit里获取步数、距离的工具类
- **LYLogTool** Log输出工具类


#### CustomView为常用自定义控件  
- **UWPasswordTextField** 快速创建密码输入框功能的按钮  
- **UWTextView** 可以设置placeholder的TextView	
- **UWCarouselView** 图片轮播的View，可设置轮播间隔，点击事件回调  
- **UWRollingView** 循环滚动展示文字和小图标的view  
- **UWImageView** 圆形头像View
- **UWTextAnimationView** 动画显示字体View


#### ThirdPartTools是对常用第三方工具的使用封装
- **LYHttpTool** 封装AFNetworking的网络工具类
- **SDWebImageManager+LY** 封装SDWebImage的下载图片接口


#### UWTabBarController为创建TabBar控制器的框架工程
用法见项目文件夹内的[(README)](https://github.com/SheldonLi/LYKit/blob/master/LYKit/UWTabBarController/UWTabBar%2BUWNavigation框架搭建.md)

#### UWDrawewController为创建Drawer控制器的框架工程
用法见项目文件夹内的[(README)](https://github.com/SheldonLi/LYKit/blob/master/LYKit/UWDrawerController/UWDrawer%2BUWNavigation框架搭建.md)

