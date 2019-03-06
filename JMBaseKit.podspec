
Pod::Spec.new do |s|

  s.name         = "JMBaseKit"
  s.version      = "2.0.3"
  s.summary      = "JMBaseKit."
  s.description  = <<-DESC
                    基础框架，方便集成，pods 管理

                    常用宏定义
                    JMApplication 系统功能单列调用

                   DESC


  s.homepage     = "https://github.com/xiaoke2015/JMBaseKit"
  s.license      = "MIT"
  s.author             = { "" => "779454060@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaoke2015/JMBaseKit.git", :tag => "#{s.version}" }

  s.source_files  = "JMBaseKit/*.{h,m}" , "JMBaseKit/**/*.{h,m}", "JMCategories/**/*.{h,m}"

end
