Pod::Spec.new do |s|
  s.name                      = "Login"
  s.version                   = "0.0.1-beta.1"
  s.summary                   = "demo: login模块"
  s.homepage                  = "https://github.com/axe-org/axe"
  s.license                   = "MIT"
  s.author                    =  "axe-org"
  s.ios.deployment_target     = "8.0"
  s.source                    = { :git => "https://git.coding.net/axe-org/demo-login.git", :tag => s.version}
  s.default_subspec           = "api"
  s.header_dir                = "Login"
  s.subspec "api" do |ss|
    ss.source_files           = "Module/API.h"
  end
  s.subspec "source" do |ss|
    ss.dependency               "Login/api"
    ss.source_files           = "Module/Classes/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.dependency               "Login/api"
    ss.vendored_frameworks    = "axe/Login.framework"
  end

  # 用户如此配置， 具体版本号与依赖设定，自动处理。
  
  
end
