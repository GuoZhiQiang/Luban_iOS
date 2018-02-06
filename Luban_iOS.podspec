#
#  Be sure to run `pod spec lint Luban_iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

 Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.name         = "Luban_iOS"
s.version      = "1.0.2"
s.summary      = "An UIImage's category to compress data almost without distortion ,Thanks to Android LuBan library"
s.description  = <<-DESC
An UIImage's category to compress data almost without distortion ,Thanks to Android LuBan library. Just pod in 2 files and no need for any setups
                   DESC
s.homepage     = "https://github.com/GuoZhiQiang/Luban_iOS"

# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.license      = { :type => "MIT", :file => "LICENSE" }

# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.author            = { "cook" => "http://www.jianshu.com/p/eb786aefdlle" }
s.social_media_url  = "http://weibo.com/2639447231/profile"

# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.platform     = :ios, "8.0"

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source = { :git => "https://github.com/GuoZhiQiang/Luban_iOS.git", :tag => "1.0.2" }

# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source_files  = "Luban_iOS_Extension_h/*.{h,m}"

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.requires_arc = true

end
