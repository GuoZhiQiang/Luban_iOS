- 带有演示效果图 `gif`，请查看 [详细说明](http://www.jianshu.com/p/7bb78eed7826)

# Luban-iOS
- 借鉴 [Android 鲁班](https://github.com/Curzibn/Luban)核心压缩算法，生成的 iOS 版 压缩代码

## 压缩比如下表.Compare：

| 机型  | 照片获取途径  | 原图大小.before | 压缩后大小.after |
|:------------- |:--------------- | :-------------| :------------- |
| 6s         | 拍照(竖屏)   | 5.19 Mb | 86.8 Kb
| 6s         | 拍照(横屏)   | 5.26 Mb | 29.2 Kb
| 7plus      | 拍照(竖屏)   | 8.05 Mb | 229.1 Kb
| 7plus      | 拍照(横屏)   | 6.34 Mb | 39.6 Kb
| 6s         | 截屏        | 1.05 Mb | 53.56 Kb
| 7plus      | 截屏        |234.7 Kb | 37.5 Kb

## 安装.Install

### Via CocoaPods
 - 在 `Podfile` 文件里添加`pod 'Luban_iOS'`

   然后在终端运行 `pod install`

### 使用.Usage
- 下载 Demo 试玩一下,看一下输出,点一下图片看压缩后的效果大图
- 导入 Category 头文件:

  `#import <Luban_iOS/UIImage+Luban_iOS_Extension_h.h>`

- 方法调用 

  `[UIImage lubanCompressImage:image]` **or**
  `[UIImage lubanCompressImage:image withMask:maskName]`

- 参数说明

 ```
/*
  image:    UIImage 对象
  withMask: 添加水印图片名字 (NSString)
*/
```
- 注意：
 添加水印时，必须提供水印图片，才能根据名字找到图片

### 后续添加的功能.Further
 - 水印支持输入文字，而不是用水印图
 - 可以根据一个本地路径，进行压缩并存储
