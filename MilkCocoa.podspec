Pod::Spec.new do |s|
  s.name             = 'MilkCocoa'
  s.version          = '1.0.0'
  s.summary          = 'A better way to drink Cocoa.'
  s.homepage         = 'https://github.com/questbeat/MilkCocoa'
  s.license          = 'MIT'
  s.author           = { 'questbeat' => 'questbeat@gmail.com' }
  s.source           = { :git => 'https://github.com/questbeat/MilkCocoa.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/questbeat'

  s.platform     = :osx, '10.6'
  s.requires_arc = true

  s.source_files = 'MilkCocoa/**/*.{h,m}'
  s.public_header_files = 'MilkCocoa/Public/**/*.h'
end
