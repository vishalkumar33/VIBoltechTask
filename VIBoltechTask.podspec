

Pod::Spec.new do |spec|

  spec.name         = "VIBoltechTask"
  spec.version      = "1.0.1"
  spec.summary      = "This is sample sdk for learning purpose"
  spec.description  = "This is sample sdk for learning purpose, I am doing a project in which try to create sampl sdk"

  spec.homepage     = "https://github.com/vishalkumar33/VIBoltechTask"
  
  spec.license      = "MIT"

  spec.author             = { "Vishal Kumar" => "vishalkumar33@hotmail.com" }

  spec.platform     = :ios, "13.0"

  spec.source       = { :git => "https://github.com/vishalkumar33/VIBoltechTask.git", :tag => spec.version.to_s }


  spec.source_files  = "BoltechTask/**/*.{swift}"
  spec.exclude_files = "BoltechTask/BoltechTaskTests/**/*" , "BoltechTask/BoltechTaskExample/**/*"

  spec.frameworks = "UIKit", "Foundation"
  spec.swift_versions = "5.0"

end
