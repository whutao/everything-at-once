Pod::Spec.new do |spec|

  spec.name         = "EverythingAtOnce"
  spec.version      = "0.0.3"
  spec.summary      = "A flexible set of extensions for many apple frameworks."

  # spec.description  = "A flexible set of extensions for many apple frameworks."

  spec.homepage     = "https://github.com/whutao/everything-at-once"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "whutao" => "nabroman42@gmail.com" }

  spec.ios.deployment_target = "13.0"
  
  spec.source       = { :git => "https://github.com/whutao/everything-at-once.git", :tag => "0.0.3" }
  
  spec.source_files  = "Sources", "Sources/**/*.{swift}"
  
  spec.framework  = "Foundation"
  
  spec.swift_versions = ["5.0"]

  spec.requires_arc = true

end
