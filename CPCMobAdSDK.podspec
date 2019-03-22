

Pod::Spec.new do |s|
  s.name             = 'CPCMobAdSDK'
  s.version          = '0.1.0.54'
  s.summary          = 'CPCMobAdSDK 广告SDK , 包含 :多图 ,图文 ,大图 ,横幅 ,文字链 ,视频 ,开屏 ,添加no_baidu字段 ,增加jason转View,趣头条版本,优化webview crash问题'


  s.description      = <<-DESC
CPCMobAdSDK 广告SDK , 包含 :多图 ,图文 ,大图 ,横幅 ,文字链 ,视频 ,开屏
删除Masonry,修复Masonry引起的一些问题,优化下载类广告需要二次点击返回
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
      'CPCMobAdSDK' => ['CPCMobAdSDK/Source/*.{png}']
      #'CPCSource' => ['CPCMobAdSDKTest/Source/*.{png}']

  }
  # s.frameworks = 'UIKit','Foundation'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit','Foundation'
  #s.subspec 'BauduMobAdSDK' do |ss|
  s.frameworks = 'UIKit','MessageUI','WebKit','CoreMedia' ,'Foundation','CoreMedia','CoreMotion','SystemConfiguration','CoreLocation','CoreTelephony','adSupport','AVFoundation'
      #end
  s.libraries = 'c++'

  s.dependency 'AFNetworking', '3.1.0'
  s.dependency 'WebViewJavascriptBridge', '6.0.3'
  s.dependency 'CPCBaiduMobAdSDK' ,'0.0.1'


  s.vendored_frameworks = 'CPCMobAdSDK/*.{framework}' 

end


