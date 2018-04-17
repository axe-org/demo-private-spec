Pod::Spec.new do |s|
  s.name                      = "Login"
  s.version                   = "0.0.1-beta.1"
  s.summary                   = "示例之 原生login模块"
  s.homepage                  = "https://github.com/axe-org/axe"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://github.com/axe-org/demo-login.git", :tag => s.version}
  s.default_subspec           = 'api'
  s.subspec "api" do |ss|
    ss.source_files           = "Login/API/*.h"
  end
  s.subspec "source" do |ss|
    ss.source_files           = "Login/Login/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.vendored_frameworks    = "axe/Login.framework"
  end

  # 用户如此配置， 具体版本号与依赖设定，自动处理。
  
end
