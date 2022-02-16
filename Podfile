platform :ios, '13.0'

use_frameworks!

pod 'Reachability', :inhibit_warnings => true

def ui_pods
    pod 'lottie-ios', :inhibit_warnings => true
end

def common_pods
    pod 'SwiftLint'
end

target 'iCook' do 
    ui_pods
    common_pods
    target 'iCookTests' do 
        inherit! :search_paths
    end 
end 

target 'iCookUI' do
    ui_pods
    common_pods
    target 'iCookUITests' do 
        inherit! :search_paths
    end 
end

target 'iCookNetworking' do
    ui_pods
    common_pods
    target 'iCookNetworkingTests' do 
        inherit! :search_paths
    end 
end


post_install do |installer|
    enable_strip(installer)
    disable_bitcode(installer)
    disable_armv7(installer)
    # strip_valid_archs(installer)
end
# Works around CocoaPods behavior designed for static libraries.
# See https://github.com/CocoaPods/CocoaPods/issues/10277
def enable_strip(installer)
    installer.pods_project.build_configurations.each do |build_configuration|
      build_configuration.build_settings['STRIP_INSTALLED_PRODUCT'] = 'YES'
    end
end

def disable_bitcode(installer)
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] = 'NO'
      end
    end
end

def disable_armv7(installer)
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['EXCLUDED_ARCHS'] = 'armv7'
      end
    end
end

def strip_valid_archs(installer)
    Dir.glob('Pods/Target Support Files/**/*.xcconfig') do |xcconfig_path|
      xcconfig = File.read(xcconfig_path)
      xcconfig_mod = xcconfig.gsub('VALID_ARCHS[sdk=iphoneos*] = arm64', '')
      xcconfig_mod = xcconfig_mod.gsub('VALID_ARCHS[sdk=iphonesimulator*] = x86_64 arm64', '')
      xcconfig_mod = xcconfig_mod.gsub('VALID_ARCHS[sdk=iphonesimulator*] = x86_64', '')
      File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
    end
end