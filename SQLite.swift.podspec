Pod::Spec.new do |s|
  s.name = 'SQLite.swift'
  s.module_name = 'SQLite'
  s.version = '0.1.0'
  s.summary = 'A type-safe, Swift-language layer over SQLite3.'

  s.description = <<-DESC
    SQLite.swift provides compile-time confidence in SQL statement syntax and
    intent.
  DESC

  s.homepage = 'https://github.com/stephencelis/SQLite.swift'
  s.license = { type: 'MIT', file: 'LICENSE.txt' }

  s.author = { 'Stephen Celis' => 'stephen@stephencelis.com' }
  s.social_media_url = 'https://twitter.com/stephencelis'

  s.library = 'sqlite3'

  s.source = {
    git: 'https://github.com/stephencelis/SQLite.swift.git',
    tag: s.version
  }

  s.prepare_command = <<-CMD
    cat > "module.map" << MAP
module sqlite3 [system] {
    header "$SDKROOT/usr/include/sqlite3.h"
    link "sqlite3"
    export *
}
MAP
  CMD

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'SQLite Common/**/*.{swift,c,h,m}'
  s.exclude_files = '**/SQLite-Bridging-Header.h'
  s.preserve_path = 'module.map'

  s.xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}/SQLite.swift ' + Dir.pwd
  }
end
