
Pod::Spec.new do |spec|

  spec.name         = "AnimationZanDemo"
  spec.version      = "0.0.2"
  spec.summary      = "Use AnimationZanDemo to realize thumb up dynamic effect."
  spec.description  = <<-DESC
    Use AnimationZanDemo to realize thumb up dynamic effect1.
                   DESC
  spec.homepage     = "https://github.com/Ama-SmallBoy/AnimationZanDemo.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Xdf" => "zhanggaotong@xdf.cn" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/Ama-SmallBoy/AnimationZanDemo.git", :tag => spec.version.to_s }
  spec.source_files  = 'AnimationZanDemo/AnimationZanSDK/**/*.{h,m}'

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  spec.resource_bundles = {
    'AnimationZanDemo' => ['AnimationZanDemo/AnimationZanSDK/Resources/Assets/**/**/*.xcassets']
  }
  spec.requires_arc = true
  spec.dependency "Masonry", "~> 1.1.0"

end
