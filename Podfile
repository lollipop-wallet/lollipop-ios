# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Lollipop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'Alamofire'
pod 'IQKeyboardManagerSwift'
pod 'SwiftyAttributes'
pod 'Firebase/Core'
pod 'Firebase/Crashlytics'
pod 'Firebase/Analytics'
pod 'Firebase/Messaging'
pod 'Firebase/Performance'
pod ‘Firebase/RemoteConfig’
pod 'Firebase/Auth'
pod 'SwiftyJSON'
pod 'FittedSheets'
pod 'KeychainSwift', '~> 19.0'
pod 'FBSDKCoreKit'
pod 'FBSDKLoginKit'
pod 'FBSDKShareKit'
pod 'Kingfisher', '~> 7.0'
pod 'SnapKit', '~> 5.0.0'
pod 'CropViewController'
pod 'PagingKit'
pod 'AlamofireImage'
pod 'FSPagerView'
pod 'Localize-Swift'
pod 'BarcodeScanner'
pod 'GoogleSignIn'
pod 'RSBarcodes_Swift', '~> 5.2.0'

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
         end
    end
  end
end

end
