Pod::Spec.new do |s|
  s.name             = 'PaulTestBeta'
  s.version          = '1.0.1-beta'
  s.summary          = 'Google Utilities for iOS (plus community support for macOS and tvOS)'

  s.description      = <<-DESC
Internal Google Utilities including Network, Reachability Environment, Logger and Swizzling for
other Google CocoaPods. They're not intended for direct public usage.
                       DESC

  s.homepage         = 'https://github.com/firebase/firebase-ios-sdk/tree/master/GoogleUtilities'
  s.license          = { :type => 'Apache', :file => 'GoogleUtilities/LICENSE' }
  s.authors          = 'Google, Inc.'

  s.source           = {
    :git => 'https://github.com/firebase/firebase-ios-sdk.git',
    :tag => 'BetaTest-' + s.version.to_s
  }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '6.0'

  s.cocoapods_version = '>= 1.4.0'
  s.prefix_header_file = false

  s.pod_target_xcconfig = {
    'GCC_C_LANGUAGE_STANDARD' => 'c99',
    'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}"',
  }

  s.subspec 'Environment' do |es|
    es.source_files = 'GoogleUtilities/Environment/**/*.[mh]'
    es.public_header_files = 'GoogleUtilities/Environment/Public/GoogleUtilities/*.h'
    es.dependency 'PromisesObjC', '~> 1.2'
  end

end
