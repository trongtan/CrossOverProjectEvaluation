# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'Alamofire'
  pod 'RealmSwift'
  pod 'SnapKit'
  pod 'SDCAlertView'
  pod 'SlideMenuControllerSwift'
  pod 'Firebase'
  pod 'ObjectMapper'
  pod 'RATreeView'
  pod 'IMTreeView'
end

def testing_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'Mockingjay', '1.1.1'
  pod 'Fakery'
  pod 'Firebase'
end

target 'CrossOverProjectEvaluation' do
  use_frameworks!

  common_pods

  target 'CrossOverProjectEvaluationTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'CrossOverProjectEvaluationUITests' do
    inherit! :search_paths
    testing_pods
    pod 'KIF', '~> 3.0', :configurations => ['Debug']
  end
end
