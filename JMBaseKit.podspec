
Pod::Spec.new do |s|

  s.name         = "JMBaseKit"
  s.version      = "0.0.1"
  s.summary      = "JMBaseKit."
  s.description  = <<-DESC
                        基础框架，方便集成，pods 管理
                   DESC
  s.homepage     = "https://github.com/xiaoke2015/JMBaseKit"
  s.license      = "MIT"
  s.author             = { "" => "779454060@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaoke2015/JMBaseKit.git", :tag => "#{s.version}" }

  s.source_files  = "pod lib lint/*.{h,m}"

end
