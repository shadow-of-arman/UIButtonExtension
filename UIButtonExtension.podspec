Pod::Spec.new do |spec|


  spec.name         = "UIButtonExtension"
  spec.version      = "0.2.2"
  spec.summary      = "Add checkboxes and radio buttons with this library."

  spec.description  = <<-DESC
  This CocoaPods library allows you to use customizable Radio buttons and checkboxes since Swift's UIKit doesn't support these natively
                    DESC
  
  spec.homepage     = "https://github.com/shadow-of-arman/UIButtonExtension"
  spec.license      = { :type => "Apache", :file => "LICENSE" }
  spec.author       = { "Arman" => "shadowofarman@hotmail.com" }
   
  spec.ios.deployment_target = "12"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/shadow-of-arman/UIButtonExtension.git", :tag => "#{spec.version}" }
  spec.source_files = "Classes", "UIButtonExtension/*.{h,m,swift}" 
  spec.resources    = "UIButtonExtension/*.xcassets"

end
