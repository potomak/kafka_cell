# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kafka_cell/version'

Gem::Specification.new do |spec|
  spec.name          = 'kafka_cell'
  spec.version       = KafkaCell::VERSION
  spec.authors       = ['Giovanni Cappellotto']
  spec.email         = ['potomak84@gmail.com']

  spec.summary       = 'Process Kafka messages asyncronously using a pool of Celluloid actors.'
  spec.description   = 'TODO: Write a longer description or delete this line.'
  spec.homepage      = 'http://github.com/potomak/kafka_cell'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rubocop', '~> 0.39.0'

  spec.add_dependency 'ruby-kafka'
  spec.add_dependency 'celluloid', '~> 0.17.0'
end
