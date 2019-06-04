

Pod::Spec.new do |s|
  s.name             = 'CPCMobAdSDK'
  s.version          = '0.1.0.94.0604.341.1' # 版本 , 日期 , 目标app版本 , 次数
  s.summary          = 'CPCMobAdSDK 广告SDK , 包含 :多图 ,图文 ,大图 ,横幅 ,文字链 ,视频 ,开屏 , 增加彩蛋 , 百度打底 , 支持gif , 新增过期检测'


  s.description      = <<-DESC
CPCMobAdSDK 广告SDK , 包含 :多图 ,图文 ,大图 ,横幅 ,文字链 ,视频 ,开屏 , 增加彩蛋 , 百度打底 , 支持gif , 新增过期检测
                       DESC


  s.homepage         = 'https://github.com/wo1348184465/CPCMobAdSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '丁昊' => 'dinghao@qutoutiao.net' }
  s.source           = { :git => 'https://github.com/wo1348184465/CPCMobAdSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # s.ios.deployment_target = '8.0'

  s.platform    = :ios, "8.0"                  #支持的平台和版本号


  s.resource_bundles = {
      # 'CPCMobAdSDK' => ['CPCMobAdSDK/Source/*.{png}']
       'CPCMobAdSDK' => ['CPCMobAdSDK/Assets/*.{xcassets}']


  }
  # s.frameworks = 'UIKit','Foundation'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #s.subspec 'BauduMobAdSDK' do |ss|
  s.frameworks = 'UIKit','MessageUI','CoreLocation','WebKit','CoreMedia' ,'Foundation','CoreMotion','SystemConfiguration','CoreLocation','CoreTelephony','adSupport','AVFoundation'
      #end
  s.libraries = 'c++'

  s.dependency 'AFNetworking', '3.1.0'
  s.dependency 'WebViewJavascriptBridge', '6.0.3'
  s.dependency 'CPCBaiduMobAdSDK' ,'0.0.1'
  s.dependency 'YYWebImage' ,'1.0.5'



  s.vendored_frameworks = 'CPCMobAdSDK/*.{framework}' 

  s.subspec 'CPCH5SDK' do |ss|
      ss.vendored_frameworks = 'CPCMobAdSDK/CPCH5SDK/*.{framework}' 

end

end




