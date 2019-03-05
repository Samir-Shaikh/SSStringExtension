#
# Be sure to run `pod lib lint SSStringExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSStringExtension'
  s.version          = '0.1.2'
  s.summary          = 'SSStringExtension is for quick method of strings.'
  s.swift_version    = '4.1'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
        SSStringExtension is a lightweight string extension for Swift. This library was motivated by having to search StackOverflow for common string operations, and wanting them to be in one place with test coverage.
                  DESC

  s.homepage         = 'https://github.com/Samir-Shaikh/SSStringExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Samir Shaikh' => 'samir.shaikh0620@gmail.com' }
  s.source           = { :git => 'https://github.com/Samir-Shaikh/SSStringExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Classes/**/*.{swift}'
  
  # s.resource_bundles = {
  #   'SSStringExtension' => ['SSStringExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
