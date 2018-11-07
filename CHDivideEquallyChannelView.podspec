
Pod::Spec.new do |s|
    s.name         = "CHDivideEquallyChannelView"
    s.version      = "0.0.4"
    s.summary      = "CHDivideEquallyChannelView可以让你快速的创建一个平分的按钮位置的频道控件"
    s.homepage     = "https://github.com/MeteoriteMan/CHDivideEquallyChannelView"
    s.license      = "MIT"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "张晨晖" => "shdows007@gmail.com" }
    s.platform     = :ios
    s.source       = { :git => "https://github.com/MeteoriteMan/CHDivideEquallyChannelView.git", :tag => s.version }
    s.source_files = 'CHDivideEquallyChannelView/**/*.{h,m}'
    s.frameworks   = 'Foundation', 'UIKit', 'Masonry'
    s.dependency 'Masonry', '~> 1.1.0'
end