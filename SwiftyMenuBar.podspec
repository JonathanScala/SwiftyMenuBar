Pod::Spec.new do |s|
  s.name             = 'SwiftyMenuBar'
  s.version          = '0.1.0'
  s.summary          = 'A neat UI lib for using top menu bars'
  s.description      = <<-DESC
                        SwiftyMenuBar is a neat little library for easily adding top menu bars to your view.
                       DESC
  s.homepage         = 'https://github.com/JonathanScala/SwiftyMenuBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jonathan Scala' => 'jonathan1234scala@gmail.com' }
  s.source           = { :git => 'https://github.com/JonathanScala/SwiftyMenuBar.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'SwiftyMenuBar/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
