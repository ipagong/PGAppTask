#
# Be sure to run `pod lib lint PGAppTask.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PGAppTask'
  s.version          = '1.0.0'
  s.summary          = 'App Task with PriorityQueue.'
  s.description      = 'Task handler for app life cycle. (Already work with distrubuted apps)'

  s.homepage         = 'https://github.com/ipagong/PGAppTask'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ipagong' => 'ipagong.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/ipagong/PGAppTask.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '11.0'

  s.source_files = 'PGAppTask/Classes/**/*'
  s.dependency 'SwiftPriorityQueue'
  
end
