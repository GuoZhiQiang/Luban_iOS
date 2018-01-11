
# [Wiki](https://github.com/GuoZhiQiang/Luban_iOS/wiki)
- 带有演示效果图 `gif`，请查看 [图文并茂](http://www.jianshu.com/p/7bb78eed7826)

# 更新.Update
- 现在可以添加自定义文字 **水印** 了 | Add custom text as an watermark to your image
- 对应的调用方法：`[UIImage lubanCompressImage:image withMask:maskName]`

# Luban-iOS
- 借鉴 [Android 鲁班](https://github.com/Curzibn/Luban)压缩库，生成的 iOS 版 压缩代码

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
   
   >注意：如果使用 `pod search Luban_iOS` or `pod search Luban-iOS` 搜不到，那么，你需要
  ```
   pod setup
   rm -rf ~/Library/Caches/Cocoapods
  ```

### 使用.Usage
- 下载 Demo 试玩一下,看一下输出,点一下图片看压缩后的效果大图
- 导入 Category 头文件:

  `#import <Luban_iOS/UIImage+Luban_iOS_Extension_h.h>`

- 方法调用 

  `[UIImage lubanCompressImage:image]` **or**
  
  `[UIImage lubanCompressImage:image withMask:maskName]` **or**
  
  `[UIImage lubanCompressImage:image withCustomImage:imageName]`

- 参数说明

 ```
/*
  image:    UIImage 对象
  withMask: 添加水印名字 (NSString)
  withCustomImage: 水印图片名称
*/
```
- 注意：
 想使用自定义文字水印的请使用方法：`[UIImage lubanCompressImage:image withMask:maskName]`
 添加水印时，想使用自定义图片水印的请使用方法：`[UIImage lubanCompressImage:image withCustomImage:imageName]` 

### 后续添加的功能.Further
 - 可以自定义水印旋转角度
 - 可以根据一个本地路径，进行压缩并存储
