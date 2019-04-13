#
# Be sure to run `pod lib lint YSHKeyBoardView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YSHKeyBoardView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YSHKeyBoardView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/793983383@qq.com/YSHKeyBoardView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '793983383@qq.com' => '793983383@qq.com' }
  s.source           = { :git => 'https://github.com/793983383@qq.com/YSHKeyBoardView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YSHKeyBoardView/Classes/**/*'
  s.resource = 'YSHKeyBoardView/Assets/*.bundle'
#  s.resource_bundles = {
#    'YSHKeyBoardView' => ['YSHKeyBoardView/Assets/*']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'YYKit', '~> 1.0.9'
end
