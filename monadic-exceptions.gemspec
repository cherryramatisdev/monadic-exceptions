# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'monadic-exceptions'
  spec.version     = '0.1.0'
  spec.summary     = 'A bridge between a exception and a Result monad provided by dry-monads gem'
  spec.description = 'A bridge between a exception and a Result monad provided by dry-monads gem'
  spec.authors     = ['Cherry Ramatis']
  spec.homepage    = 'https://github.com/cherryramatisdev/monadic-exceptions.git'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.0.0'

  spec.require_paths = ['lib']
  spec.files         = Dir['LICENSE', 'README.md', 'monadic-exceptions.gemspec', 'lib/**/*']

  spec.add_dependency 'dry-monads', '~> 1.5'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
