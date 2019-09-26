
Pod::Spec.new do |s|
  s.name             = 'WXAuthTool'
  s.version          = '0.2.0'
  s.summary          = '微信登录'
  s.description      = <<-DESC
微信登录工具类
                       DESC

  s.homepage         = 'https://github.com/lyuxxx/WXAuthTool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lyuxxx' => 'lyxiel@163.com' }
  s.source           = { :git => 'https://github.com/lyuxxx/WXAuthTool.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'WXAuthTool/*.{h,m}'
  s.public_header_files = "WXAuthTool/WXAuthTool.h"
  s.requires_arc = true

  s.dependency "XXWeChatSDK"

end
