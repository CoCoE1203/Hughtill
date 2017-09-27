Pod::Spec.new do |s|
  s.name         = "Hughtill"
  s.version      = "0.2.1"
  s.summary      = "Hugh Skill in Hughtill"
  s.description      = <<-DESC
					Simple test the PodRegistTest!!!
                      DESC
  s.homepage         = 'https://github.com/CoCoE1203/Hughtill.git'
  #s.screenshots      = 'https://magi82.github.io/images/01.png'
                       
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "dragoaa90@gmail.com" => "dragoa90@gmail.com" }
  s.source       = { :git => "https://github.com/CoCoE1203/Hughtill.git", :tag => s.version }
  s.ios.deployment_target = '7.0'
  s.source_files = 'Hughtill/Hughtill/Htills/*.{h,m}'
  s.requires_arc = true
end
