Pod::Spec.new do |s|
  s.name                      = "Test"
  s.version                   = "0.0.1-beta.2"
  s.summary                   = "示例之 原生Test模块"
  s.homepage                  = "https://github.com/axe-org/demo-test"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://gitlab.com/axe-org/demo-test.git", :tag => s.version}
  s.default_subspec           = 'api'
  s.header_dir                = 'Test'
  s.subspec "api" do |ss|
    ss.source_files           = "Test/API/API.h"
  end
  s.subspec "source" do |ss|
    ss.dependency             'Test/api'
    ss.source_files           = "Test/Test/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.dependency             'Test/api'
    ss.vendored_frameworks    = "axe/Test.framework"
  end

  # 用户如此配置， 具体版本号与依赖设定，自动处理。
  
  s.dependency 'Login' , '>= 0.0.2-beta.0', '< 1.0.0'
end
