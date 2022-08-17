Pod::Spec.new do |spec|

spec.name = "EverythingAtOnce"
spec.version = "0.0.4"
spec.summary = "A flexible set of extensions for many apple frameworks."

# spec.description  = "A flexible set of extensions for many apple frameworks."

spec.license = { :type => "MIT", :file => "LICENSE" }
spec.author = { "whutao" => "nabroman42@gmail.com" }
spec.homepage = "https://github.com/whutao/everything-at-once"

spec.ios.deployment_target = "13.0"

spec.source = {
    :git => "https://github.com/whutao/everything-at-once.git",
    :tag => spec.version.to_s
}

spec.swift_versions = ["5.0"]
spec.framework  = "Foundation"
spec.source_files  = "Sources", "Sources/**/*.{swift}"

spec.subspec 'EOSwift' do |lib|
    lib.source_files = "Sources/EOSwift/**/*.{swift}"
end

end
