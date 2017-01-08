Pod::Spec.new do |s|

  s.name = 'FHFoundation'
  s.version = '1.0'
  s.description = <<-DESC
        FHFoundation,基础框架
          DESC
 
  s.license = 'MIT'
  s.summary = 'FHFoundation'
  s.homepage = 'https://github.com/shenfh/FHFoundation.git'
  s.authors = { 'shenfh' => '' }
  s.source = { :git => 'https://github.com/shenfh/FHFoundation.git', :branch => 'master' }
  s.requires_arc = true
  s.ios.deployment_target = '7.0'  
 

  s.source_files = 'FHFoundation/*.{h,m}'

  s.subspec 'Runtime' do |ss|
    ss.source_files = 'FHFoundation/Runtime/**/*.{h,m}'
    ss.public_header_files = 'FHFoundation/Runtime/**/*.{h}'
  end

  s.subspec 'SafeCategory' do |ss|
    ss.source_files = 'FHFoundation/SafeCategory/**/*.{h,m}'
  end

  s.subspec 'Thread' do |ss|
    ss.source_files = 'FHFoundation/Thread/**/*.{h,m}'
  end

  s.resources = 'FHFoundation/**/*.{xib,json,png,jpg,gif,js}'


  #s.dependency 'ReactiveCocoa' 
end
