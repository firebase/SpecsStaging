Pod::Spec.new do |s|
  s.name         =  'leveldb-library'
  # When updating the version, be sure to update the `:tag` as well.
  s.version      =  '1.22.1'
  s.license      =  'New BSD'
  s.summary      =  'A fast key-value storage library '
  s.description  =  'LevelDB is a fast key-value storage library written at Google that provides ' +
                    'an ordered mapping from string keys to string values.'
  s.homepage     =  'https://github.com/google/leveldb'
  s.authors      =  'The LevelDB Authors'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '6.0'

  s.source       =  { 
    :git => 'https://github.com/google/leveldb.git',
    # Hardcoded to 1.22 since this was a podspec only update.
    :tag => '1.22'
  }

  s.requires_arc = false

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'LEVELDB_IS_BIG_ENDIAN=0 ' +
                                      'LEVELDB_PLATFORM_POSIX ' +
                                      'HAVE_FULLFSYNC=1',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/leveldb-library" ' +
                             '"${PODS_ROOT}/leveldb-library/include"',

    # Disable warnings introduced by Xcode 8.3 and Xcode 9
    # The deprecated-declarations is for OSMemoryBarrier on tvOS
    'WARNING_CFLAGS' => '-Wno-shorten-64-to-32 -Wno-comma -Wno-unreachable-code ' +
                        '-Wno-conditional-uninitialized -Wno-deprecated-declarations',

    # Prevent naming conflicts between leveldb headers and system headers
    'USE_HEADERMAP' => 'No',
  }

  s.header_dir = "leveldb"
  s.source_files = [
    "db/*.{cc,h}",
    "port/*.{cc,h}",
    "table/*.{cc,h}",
    "util/*.{cc,h}",
    "include/leveldb/*.h"
  ]

  s.public_header_files = [
    "include/leveldb/*.h"
  ]

  s.exclude_files = [
    "**/*_test.cc",
    "**/*_bench.cc",
    "db/leveldbutil.cc",
    "util/env_windows.cc",
    "util/testutil.cc"
  ]

  s.library = 'c++'
end
