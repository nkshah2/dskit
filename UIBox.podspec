#
# Be sure to run `pod lib lint DSKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIBox'
  s.version          = '0.1.0'
  s.summary          = 'A design kit developed to be used with SwiftUI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"DSKit is a design system for SwiftUI. It is designed to make building your app much easier with built in ViewModifiers that let you apply consitent styling to all your Views without needing to manually set modifiers to them. Provide custom values for spacing and DSKit handles the rest for you! Quick, easy and beatuiful, build apps like never before"
                       DESC

  s.homepage         = 'https://github.com/nkshah2/UIBox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nkshah2' => 'nemishah1212@gmail.com' }
  s.source           = { :git => 'https://github.com/nkshah2/UIBox.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/NemiShah3'

  s.ios.deployment_target = '14.0'

  s.source_files = 'DSKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DSKit' => ['DSKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
