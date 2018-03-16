

Pod::Spec.new do |s|

  s.name         = "YGNetworkHelper"
  s.version      = "0.0.1"
  s.summary      = "AFNetworking 3.x 与 YYCache 封装而成,简化网络请求和数据缓存调用方法!"
  s.homepage     = "https://github.com/Starryxu/YGNetworkHelper.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "xuyaguang" => "xu_yaguang@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Starryxu/YGNetworkHelper.git", :tag => s.version.to_s }
  s.source_files  = "YGNetworkHelper/YGNetworkHelper/*.{h,m}"
  s.requires_arc = true
  s.dependency 'AFNetworking'
  s.dependency 'YYCache'

end
