# UWorks-iOS公共库

### 工程通过cocoapod管理
**目前使用到的框架有:**

* 'AFNetworking', '~> 3.0.4'
* 'SDWebImage', '~> 3.7.3'
* 'SVProgressHUD', '~> 1.1.3'
* 'MBProgressHUD', '~> 0.9.1'
* 'FMDB', '~> 2.5'
* 'MJExtension', '~> 2.5.12'
* 'MJRefresh', '~> 2.4.10'

### 源代码在uworks-library目录下，包括自定义的代码段、分类工具、自定义控件等


#### Category为常用类扩展
- **NSString+DateTool** 字符串的时间处理工具[(接口见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **NSString+Predicate** 字符串正则判断工具[(接口见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **NSString+LY** 字符串处理其他工具[(接口见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **UIImage+LY** 为UIImage的处理工具[(接口见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **UIView+FrameTool** 为UIView快速设置Frame的处理工具
- **UIButton+UW** 快速创建UIButton的工具
- **NSString+SandBox** 获取沙盒路径的工具
- **NSObject+UWArchive** 为自动归档与解档的分类[(说明及用法)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/blob/master/uworks-library/Category/NSObject+UWArchive.h)
- **UIImage+UWMainBudleImage** 获取MainBudle里LaunchImage与IconImage的工具
- **NSObject+UWDescription** 在NSLog中或lldb的po命令时，自动打印model内的属性值，0代码实现，拖入工具即可使用

#### Tools为常用功能类
- **ColorAndFontHeader.h**颜色与字体的快速宏定义
- **ScreenHeader.h** 判断屏幕的快速宏定义
- **Reachability** 网络监测第三方工具
- **UWToast** 自定义弹出框控件[(接口见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **UWUploadImages** 图片上传工具
- **UWPopViewController** 为淡入淡出控制器，默认背景alpha为0.5，在屏幕中央出现[(用法见wiki)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/wikis/home)
- **SettingTool** 一个Xcode部署配置方案工具
- **UWCatchCrash** 崩溃日志收集工具
- **UWNetReach** 网络监测工具

    

#### CustomView为常用自定义控件
- **UWButton** 快速创建默认圆角的按钮，可设置圆角大小（默认为宽度的4%）  
- **UWCountdownButton** 快速创建倒计时功能的按钮  
- **UITextField** 快速创建一般输入框功能的按钮  
- **UWPasswordTextField** 快速创建密码输入框功能的按钮  
- **UWTextView** 可以设置placeholder的TextView	
- **UWCarouselView** 图片轮播的View，可设置轮播间隔，点击事件回调  
- **UWRollingView** 循环滚动展示文字和小图标的view  
- **UWImageView** 圆形头像View
- **UWTextAnimationView** 动画显示字体View


#### ThirdPartTools是对常用第三方工具的使用封装
- **UWHttpTool** 封装AFNetworking的网络工具类
- **SDWebImageManager+UW** 封装SDWebImage的下载图片接口
- **UWWebImageTool** 封装SDWebImage的工具
- **UWRefreshTool** 封装MJRefresh的刷新工具
- **UWProgressHUDTool** 封装MBProgressHUD的进度工具


#### UWTabBarController为创建TabBar控制器的框架工程
用法见项目文件夹内的[(README)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/blob/master/uworks-library/UWTabBarController/UWTabBar+UWNavigation框架搭建.md)

#### UWDrawewController为创建Drawer控制器的框架工程
用法见项目文件夹内的[(README)](http://code.uworks.cc/uworks-iOS/uworks-library-iOS/blob/master/uworks-library/UWDrawerController/UWDrawer+UWNavigation框架搭建.md)


----
###!NOT AVAILABLE
#### SettingModuleProject为创建设置界面的工程

#### leadPagesProject为创建引导页的工程

#### gestureLockView为创建手势解锁的工程

#### UWImagePicker 创建相册图片多选

	该方法为进入相册的方法
    UWImagePickerViewController 为相册的controlle  
     
   	UWImagePickerViewController *pickerVc 	=[[UWImagePickerViewController alloc] init];
   	
    pickerVc.uwmaxCount = num;设最多选择的图片数量
    pickerVc.uwstatus = PickerViewShowStatusCameraRoll;设置进入相册的目录
    pickerVc.uwdelegate =self;选择完相册的代理
    pickerVc.showDelegate = self;
    [pickerVc showControlle];
   
   
 	- (void)uwpickerViewControllerDoneAsstes : (NSArray 	*) assets
	{
    NSMutableArray *photoArray = [NSMutableArray 	arrayWithCapacity:0];
    
    for (MLSelectPhotoAssets *photoAsset in assets)
  	  {
  	  //MLSelectPhotoAssets 是用来解析从相册获取到的数据包
  	  
        UIImage *image = [UWImagePickerViewController 	getImageWithImageObj:photoAsset.thumbImage];
        [photoArray addObject:image];
        
    }
    
    [_select getThumbnailPhotos:photoArray];
	}
	
 *selectPhotoView为选择后的缩略图
 	//该方法是添加图片的按钮的代理方法，每次
 	- (void)addNumberThumbnail:(NSUInteger)num;

 

    




