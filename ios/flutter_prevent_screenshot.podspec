#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint disable_screenshots.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_prevent_screenshot'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to enable, disable or toggle screenshot support in your application.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://app-master.online'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Appmaster' => 'info@app-master.online' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ScreenProtectorKit', '~> 1.3.1'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version    = ["4.0", "4.1", "4.2", "5.0", "5.1", "5.2", "5.3", "5.4", "5.5"]
end
