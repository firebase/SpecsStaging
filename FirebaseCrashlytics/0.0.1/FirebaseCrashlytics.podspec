Pod::Spec.new do |s|
  s.name             = 'FirebaseCrashlytics'
  s.version          = '0.0.1'
  s.summary          = 'Best and lightest-weight crash reporting for mobile, desktop and tvOS.'

  s.description      = <<-DESC
Best and lightest-weight crash reporting for mobile, desktop and tvOS TBD-longer.
                       DESC

  s.homepage         = 'https://developers.google.com/'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.authors          = 'Google, Inc.'
  s.source           = {
    :git => 'https://github.com/firebase/firebase-ios-sdk.git',
    :tag => 'Crashlytics-' + s.version.to_s
  }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '10.0'

  s.cocoapods_version = '>= 1.4.0'
  s.static_framework = true
  s.prefix_header_file = false

  s.source_files = 'Crashlytics/Crashlytics/**/*.{c,h,m,mm}'
  s.public_header_files = [
    'Crashlytics/Crashlytics/API/CLSAttributes.h',
    'Crashlytics/Crashlytics/API/CLSLogging.h',
    'Crashlytics/Crashlytics/API/CLSReport.h',
    'Crashlytics/Crashlytics/API/CLSStackFrame.h',
    'Crashlytics/Crashlytics/API/Crashlytics.h'
  ]

  s.dependency 'FirebaseCore', '~> 5.1'
  s.dependency 'GoogleUtilities/UserDefaults', '~> 5.3'

  s.libraries = 'c++', 'z'
  s.frameworks = 'Security', 'SystemConfiguration'

  s.ios.pod_target_xcconfig = {
    'GCC_C_LANGUAGE_STANDARD' => 'c99',
    'GCC_PREPROCESSOR_DEFINITIONS' =>
      "BUILD_VERSION=135 " +
      'DISPLAY_VERSION=' + s.version.to_s + ' ' +
      'CLS_PLATFORM_NAME=ios ' +
      'CLS_SDK_NAME="Crashlytics iOS SDK" ' +
      'CLS_DEVELOPER_TOKEN=77f0789d8e230eccdb4b99b82dccd78d47f9b604',
    'OTHER_LD_FLAGS' => '$(inherited) -sectcreate __TEXT __info_plist'
  }

  s.osx.pod_target_xcconfig = {
    'GCC_C_LANGUAGE_STANDARD' => 'c99',
    'GCC_PREPROCESSOR_DEFINITIONS' =>
      "BUILD_VERSION=135 " +
      'DISPLAY_VERSION=' + s.version.to_s + ' ' +
      'CLS_PLATFORM_NAME=mac ' +
      'CLS_SDK_NAME="Crashlytics Mac SDK" ' +
      'CLS_DEVELOPER_TOKEN=77f0789d8e230eccdb4b99b82dccd78d47f9b604',
    'OTHER_LD_FLAGS' => '$(inherited) -sectcreate __TEXT __info_plist'
  }

  s.tvos.pod_target_xcconfig = {
    'GCC_C_LANGUAGE_STANDARD' => 'c99',
    'GCC_PREPROCESSOR_DEFINITIONS' =>
      "BUILD_VERSION=135 " +
      'DISPLAY_VERSION=' + s.version.to_s + ' ' +
      'CLS_PLATFORM_NAME=tvos ' +
      'CLS_SDK_NAME="Crashlytics tvOS SDK" ' +
      'CLS_DEVELOPER_TOKEN=77f0789d8e230eccdb4b99b82dccd78d47f9b604',
    'OTHER_LD_FLAGS' => '$(inherited) -sectcreate __TEXT __info_plist'
  }

  s.test_spec 'unit' do |unit_tests|
    unit_tests.source_files = 'Crashlytics/UnitTests/*.[mh]',
                              'Crashlytics/UnitTests/*/*.[mh]'
    unit_tests.dependency 'OCMock', '~> 3.4'
    unit_tests.resources = 'Crashlytics/UnitTests/Data/*',
                           'Crashlytics/UnitTests/*.clsrecord',
                           'Crashlytics/UnitTests/CLSMachO/data/*'
  end
end
