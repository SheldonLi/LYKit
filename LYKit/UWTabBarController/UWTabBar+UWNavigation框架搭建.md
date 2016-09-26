#UWTabBar+UWNavigation框架搭建

在使用CYLTabBarController框架的基础上完善navigationController，满足一般tabbarController的使用，支持自定义返回按钮与右滑返回

使用方法：

1. 导入**CYLTabBarController**文件夹（来源：[CYLTabBarController](https://github.com/ChenYilong/CYLTabBarController)）
2. 导入**UWTabBar+Nav**文件夹
3. 在**UWTabbBarController.m**里创建子控制器
4. 在**UWTabbBarController.m**里设置tabBar子控制器的title，image
5. 在**UWNavigationController.m**里设置navigationBar样式的数据,以及导航控制器的设置
6. 若tabBar中间有不规则按钮，则加上**UWPlusButton**文件，设置图片、尺寸、点击处理(没有的话删除文件即可)

