# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cql_qdm_patientapi/version'

Gem::Specification.new do |spec|
  spec.name          = "cql_qdm_patientapi"
  spec.version       = CqlQdmPatientapi::VERSION
  spec.authors     = ['The MITRE Corporation']
  spec.email       = ['tacoma-list@lists.mitre.org']

  spec.summary     = 'QDM CQL execution engine'
  spec.description = 'Interface from HDS patient model to QDM CQL execution engine'
  spec.homepage    = 'https://github.com/projecttacoma/cql_qdm_patientapi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = "Apache-2.0"

  spec.add_dependency 'rails', '~> 4.2'
  spec.add_dependency 'coffee-rails', '~> 4.2'

end
