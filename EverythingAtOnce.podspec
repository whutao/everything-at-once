Pod::Spec.new do |spec|

spec.name = "EverythingAtOnce"
spec.version = "0.0.6"
spec.summary = "A flexible set of extensions for many apple frameworks."

spec.license = { :type => "MIT", :file => "LICENSE" }
spec.author = { "whutao" => "nabroman42@gmail.com" }
spec.homepage = "https://github.com/whutao/everything-at-once"

spec.source = {
    :git => "https://github.com/whutao/everything-at-once.git",
    :tag => spec.version.to_s
}

spec.swift_versions = ["5.0"]
spec.requires_arc = true
spec.ios.deployment_target = "13.0"

spec.subspec 'EOSwift' do |lib|
    lib.source_files = "Sources/EOSwift/**/*.{swift}"
end

spec.subspec 'EOFoundation' do |lib|
    lib.dependency 'EverythingAtOnce/EOSwift'
    lib.source_files = "Sources/EOFoundation/**/*.{swift}"
end

spec.subspec 'EOCoreGraphics' do |lib|
    lib.source_files = "Sources/EOCoreGraphics/**/*.{swift}"
end

spec.subspec 'EOPropertyWrapper' do |lib|
    lib.source_files = "Sources/EOPropertyWrapper/**/*.{swift}"
end

spec.subspec 'EOUtils' do |lib|
    lib.dependency 'EverythingAtOnce/EOSwift'
    lib.source_files = "Sources/EOUtils/**/*.{swift}"
end

spec.subspec 'EOConcurrency' do |lib|
    lib.source_files = "Sources/EOConcurrency/**/*.{swift}"
end

spec.subspec 'EOCoreAnimation' do |lib|
    lib.source_files = "Sources/EOCoreAnimation/**/*.{swift}"
end

end
