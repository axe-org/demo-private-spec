Pod::Spec.new do |s|
  s.name                      = "Ground"
  s.version                   = "0.0.1-beta.0"
  s.summary                   = "地基 podspec，解决基础组件中的header问题"
  s.homepage                  = "https://github.com/axe-org/axe"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://github.com/axe-org/demo-ground.git", :tag => s.version}
  s.subspec "source" do |ss|
    # 对于源码接入时，需要引入所有依赖
    ss.dependency             "Axe/TabBarController"
    ss.dependency             "Axe/OfflineHtml"
    ss.dependency             "Axe/OfflineReact"
    ss.dependency             "React/CxxBridge"
    ss.dependency             "React/RCTText"
    ss.dependency             "React/RCTNetwork"
    # 第三方组件示例
    ss.dependency             "Bugly"
    ss.source_files           = "Ground/**/*.{h,m}"
  end
  s.subspec "release" do |ss|
    ss.subspec "headers" do |sss|
      sss.source_files        = ".axe/Headers/src/*.h" , "Ground/**/*.h"
      # 读取记录数据，动态创建子库
      require "json"
      headerDirs = File.exist?(".axe/Headers/dir.json") ? JSON.parse(File.read(".axe/Headers/dir.json")) : []
      headerDirs.each do |dir|
         sss.subspec dir do |ssss|
            ssss.source_files = ".axe/Headers/dir/#{dir}/*.h"
            ssss.header_dir   = dir
         end
      end
    end
    ss.vendored_frameworks    = ".axe/Ground.framework"
  end
end
