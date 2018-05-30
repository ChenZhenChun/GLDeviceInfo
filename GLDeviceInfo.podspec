Pod::Spec.new do |s|
#name必须与文件名一致
s.name              = "GLDeviceInfo"

#更新代码必须修改版本号
s.version           = "0.0.1"
s.summary           = "Manage local notifications for ios."
s.description       = <<-DESC
It is a GLDeviceInfo used on iOS, which implement by Objective-C.
DESC
s.homepage          = "https://github.com/ChenZhenChun/GLDeviceInfo"
s.license           = 'MIT'
s.author            = { "ChenZhenChun" => "346891964@qq.com" }

#submodules 是否支持子模块
s.source            = { :git => "https://github.com/ChenZhenChun/GLDeviceInfo.git", :tag => s.version, :submodules => true}
s.platform          = :ios, '7.0'
s.requires_arc = true

#source_files路径是相对podspec文件的路径

#核心模块
s.subspec 'GLDeviceInfo' do |ss|
ss.source_files = 'GLDeviceInfo/GLDeviceInfo/*.{h,m}'
ss.public_header_files = 'GLDeviceInfo/GLDeviceInfo/*.h'
end

s.frameworks = 'Foundation', 'UIKit'


# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'

end
