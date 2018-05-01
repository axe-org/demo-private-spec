Pod::Spec.new do |s|
  s.name                      = "User"
  s.version                   = "0.0.2-beta.1"
  s.summary                   = "示例之 原生user模块"
  s.homepage                  = "https://github.com/axe-org/demo-user"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://github.com/axe-org/demo-user-git", :tag => s.version}
  s.default_subspec           = 'api'
  s.header_dir                = 'User'
  s.subspec "api" do |ss|
    ss.source_files           = "User/API/API.h"
  end
  s.subspec "source" do |ss|
    ss.dependency             'User/api'
    ss.source_files           = "User/User/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.dependency             'User/api'
    ss.vendored_frameworks    = "axe/User.framework"
  end

  # 用户如此配置， 具体版本号与依赖设定，自动处理。
  
  s.dependency 'Login' , '>= 0.0.1-beta.0', '< 1.0.0'
end
