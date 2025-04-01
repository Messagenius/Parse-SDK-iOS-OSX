Pod::Spec.new do |s|
  s.name         = "Parse"
  s.version      = "1.0.0" # Adjust version as needed
  s.summary      = "The Parse SDK for iOS, OS X, watchOS, and tvOS."
  s.description  = <<-DESC
                       Parse is a complete backend platform that provides an easy way to sync, store, and query your app’s data.
                       DESC
  s.homepage     = "https://parseplatform.org/"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Parse Community" => "community@parseplatform.org" }
  s.source       = { :git => "https://github.com/parse-community/Parse-SDK-iOS-OSX.git", :tag => "1.0.0" }
  s.platform     = :ios, "13.0"
  s.requires_arc = true
  s.module_name  = "Parse"
  s.default_subspec = 'Core'
  s.swift_versions = "5.9"

  s.subspec "Core" do |ss|
    # Specify the source files
    ss.source_files = 'Parse/Parse/Source/*.{h,m}',
                      'Parse/Parse/Internal/**/*.{h,m}'
                      #'ParseLiveQuery/ParseLiveQuery/**/*.swift'

    # Public headers
    ss.public_header_files = "Parse/Parse/*.h"
    ss.private_header_files = 'Parse/Parse/Internal/**/*.h'
    ss.exclude_files = [
      "Parse/Parse/Resources/Parse-tvOS.Info.plist",
      "Parse/Parse/Resources/Parse-iOS.Info.plist",
      "Parse/Parse/Resources/Parse-OSX.Info.plist",
      "Parse/Parse/Resources/Parse-watchOS.Info.plist",
      "ParseLiveQuery/ParseLiveQuery/Resources/Info.plist"
    ]

    # Dependencies
    ss.dependency "Bolts", "~> 1.10.0"
    ss.dependency "Bolts-Swift", "~> 1.5.0"
    ss.dependency "Starscream", "~> 4.0.8"
  end
  
  # ParseLiveQuery as a separate subspec
  s.subspec "LiveQuery" do |ss|
    ss.source_files = "ParseLiveQuery/ParseLiveQuery/**/*.swift"
    ss.exclude_files = ["ParseLiveQuery/ParseLiveQuery/Resources/Info.plist"]
    
    ss.dependency "Parse/Core"
    ss.dependency "Bolts-Swift", "~> 1.5.0"
    ss.dependency "Starscream", "~> 4.0.8"
  end
  
end
