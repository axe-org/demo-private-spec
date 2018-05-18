Pod::Spec.new do |s|
  s.name                      = "Login"
  s.version                   = "0.0.2-beta.2"
  s.summary                   = "示例之 原生login模块"
  s.homepage                  = "https://github.com/axe-org/demo-login"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://git.coding.net/axe-org/demo-login.git", :tag => s.version}
  s.default_subspec           = 'api'
  s.header_dir                = 'Login'
  s.subspec "api" do |ss|
    ss.source_files           = "Login/API/API.h"
  end
  s.subspec "source" do |ss|
    ss.dependency             'Login/api'
    ss.source_files           = "Login/Login/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.dependency             'Login/api'
    ss.vendored_frameworks    = "axe/Login.framework"
  end

  # 用户如此配置， 具体版本号与依赖设定，自动处理。
  
end
