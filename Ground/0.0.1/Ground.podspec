# 这是配置的 podspec ，由axe进行一些加工与处理。
Pod::Spec.new do |s|
  s.name                      = "Ground"
  s.version                   = "0.0.1"
  s.summary                   = "地基 podspec，解决基础组件中的header问题"
  s.homepage                  = "https://github.com/axe-org/demo-ground"
  s.license                   = { :type => "MIT"}
  s.author                    = { "luoxianming" => "luoxianmingg@gmail.com" }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => "https://git.coding.net/axe-org/demo-ground.git", :tag => s.version}
  s.subspec "source" do |ss|
    #对于源码接入:
    ss.source_files           = "Ground/**/*.{h,m}"
    ss.dependency             "Axe"
    #需要引入所有依赖
    ss.dependency             "MXReact/CxxBridge"
    ss.dependency             "MXReact/RCTText"
    ss.dependency             "MXReact/RCTNetwork"
    ss.dependency             "MXReact/RCTImage"
    # 第三方组件示例
    ss.dependency             'MBProgressHUD', '~> 1.1.0'
    ss.dependency             'Masonry'
    ss.dependency             'JSONModel'
  end
  s.subspec "release" do |ss|
    ss.subspec "headers" do |sss|
      sss.source_files        = "axe/Headers/src/*.h" , "Ground/**/*.h"
      # 对于 ground模块， 还要特殊处理header . 自动将所有的依赖的更底层的基础组件整合在一起，但是依旧可以使用原有的头文件方式进行引用。
      # 需要注意的是， 这里的 ss.subspec "headers" do |sss| 必须为 |sss|
      
      sss.subspec 'yoga' do |ssss|
        ssss.source_files = 'axe/Headers/dir/yoga/*.h'
        ssss.header_dir   = 'yoga'
      end
      sss.subspec 'React' do |ssss|
        ssss.source_files = 'axe/Headers/dir/React/*.h'
        ssss.header_dir   = 'React'
      end
      sss.subspec 'glog' do |ssss|
        ssss.source_files = 'axe/Headers/dir/glog/*.h'
        ssss.header_dir   = 'glog'
      end

    end
    ss.vendored_frameworks    = "axe/Ground.framework"
  end
end
