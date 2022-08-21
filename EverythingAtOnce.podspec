Pod::Spec.new do |spec|

spec.name = 'EverythingAtOnce'
spec.module_name = 'EverythingAtOnce'
spec.version = '0.0.10'
spec.summary = 'A flexible set of extensions for many apple frameworks.'

spec.author = { 'whutao' => 'nabroman42@gmail.com' }
spec.homepage = 'https://github.com/whutao/everything-at-once'
spec.license = { type: 'MIT', file: 'LICENSE' }

spec.source = { git: 'https://github.com/whutao/everything-at-once.git', tag: spec.version.to_s }

spec.swift_versions = '5.0'
spec.requires_arc = true
spec.source_files = 'Sources/**/*.{swift}'
spec.framework = 'Foundation'
spec.ios.deployment_target = '13.0'

spec.subspec 'EOConcurrency' do |subspec|
    subspec.source_files = 'Sources/EOConcurrency/*.{swift}'
end

spec.subspec 'EOPropertyWrapper' do |subspec|
    subspec.source_files = 'Sources/EOPropertyWrapper/*.{swift}', 'Sources/EOConcurrency/*.{swift}'
end

end
