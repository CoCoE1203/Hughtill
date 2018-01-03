Pod::Spec.new do |s|
  s.name        	= 'Hughtill'
  s.version     	= '0.2.58'
  s.license         = 'MIT'
  s.summary      	= 'Im iOS developer'
  s.homepage        = 'https://github.com/CoCoE1203/Hughtill.git'
  #s.screenshots    = 'https://magi82.github.io/images/01.png'
  s.author          = { 'Hugh' => "dragoa90@gmail.com' }
  s.source       	= { :git => 'https://github.com/CoCoE1203/Hughtill.git', :tag => s.version }
  s.source_files 	= 'Hughtill/Hughtill/Htills/*.{h,m}'
  s.requires_arc 	= true
  s.social_media_url = 'http://goldcocoe.tistory.com/'
  s.ios.deployment_target = '7.0'
end
