
Pod::Spec.new do |s|

  s.name         = "JMBaseKit"
  s.version      = "1.0.0"
  s.summary      = "JMBaseKit."
  s.description  = <<-DESC
                        基础框架，方便集成，pods 管理
                    0.0.1 版本更改
                    0.0.2 版本采用分类
                    1.0.0 添加 JMAppConst 类 管理App常量
                    封装常用方法
                   DESC
  s.homepage     = "https://github.com/xiaoke2015/JMBaseKit"
  s.license      = "MIT"
  s.author             = { "" => "779454060@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaoke2015/JMBaseKit.git", :tag => "#{s.version}" }

  s.source_files  = "JMBaseKit/*.{h,m}"

end
