Pod::Spec.new do |s| 
  s.name         = "Hughtill"
  s.version      = "0.3.1"
  s.summary      = "Im iOS developer."
  s.homepage     = 'https://github.com/CoCoE1203/Hughtill.git'
  #s.screenshots = 'https://magi82.github.io/images/01.png'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "dragoaa90@gmail.com" => "dragoa90@gmail.com" }
  s.source       = { :git => "https://github.com/CoCoE1203/Hughtill.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = 'Hughtill/Hughtill/Htills/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
  s.requires_arc = true
end
