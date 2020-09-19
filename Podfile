platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

def app_pods

# Architecture
pod 'ReactorKit'

# Coordinator
# pod 'RxFlow', '2.4.0'

# Reactive
pod 'RxSwift'
pod 'RxCocoa'
pod 'RxDataSources'
pod 'RxOptional'
pod 'RxKeyboard'

# UI
pod 'SnapKit'
pod 'Toaster', :git => 'https://github.com/devxoul/Toaster.git', :branch => 'master'
pod 'PanModal'

# Keychain
pod 'KeychainAccess'

# DB
pod 'RealmSwift'

# Logger
pod 'SwiftyBeaver'

# Network
pod 'Moya/RxSwift'
pod 'Kingfisher'

# etc
pod 'Firebase/Core'
pod 'Firebase/RemoteConfig'
pod 'Firebase/Analytics'
pod 'Firebase/Performance'
pod 'Fabric'
pod 'Crashlytics'
pod 'SwiftLint'
pod 'AcknowList'
pod 'Bagel'
pod 'Kanna'

end

target 'GitTime' do
  
  app_pods
  
  target 'GitTimeTests' do
    inherit! :search_paths
#    app_pods
  end
  
  target 'GitTimeUITests' do
    inherit! :search_paths
# app_pods
  end
end


