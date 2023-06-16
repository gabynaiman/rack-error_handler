# coding: utf-8
require_relative 'lib/rack/error_handler/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-error_handler'
  spec.version       = Rack::ErrorHandler::VERSION
  spec.authors       = ['Gabriel Naiman']
  spec.email         = ['gabynaiman@gmail.com']

  spec.summary       = 'Rack middleware to log request errors and respond with standard message'
  spec.description   = 'Rack middleware to log request errors and respond with standard message'
  spec.homepage      = 'https://github.com/gabynaiman/rack-error_handler'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rack'

  spec.add_development_dependency 'rack-test', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'minitest', '~> 5.0', '< 5.11'
  spec.add_development_dependency 'minitest-colorin', '~> 0.1'
  spec.add_development_dependency 'minitest-line', '~> 0.6'
  spec.add_development_dependency 'simplecov', '~> 0.14'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'pry-nav', '~> 0.2'
end