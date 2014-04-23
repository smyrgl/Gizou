Pod::Spec.new do |s|
  s.name             = "Gizou"
  s.version          = "0.1.0"
  s.summary          = "A library for creating test data."
  s.homepage         = "https://github.com/smyrgl/Gizou"
  s.license          = 'MIT'
  s.author           = { "John Tumminaro" => "john@tinylittlegears.com" }
  s.source           = { :git => "https://github.com/smyrgl/Gizou.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.1'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resource_bundle = {'Gizou' => 'Assets/*.json'}

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  s.public_header_files = 'Classes/*.h'
  s.frameworks = 'Foundation'

  s.subspec 'Location' do |ss|
    ss.source_files = 'Classes/GZLocations+CoreLocationExtensions.{h,m}'
    ss.frameworks = 'CoreLocation'
  end
end
