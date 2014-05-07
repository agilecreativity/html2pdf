# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html2pdf/version'

Gem::Specification.new do |spec|
  spec.name          = 'html2pdf'
  spec.version       = Html2Pdf::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q(Export html or xhtml file to pdfs with using the power of 'wkhtmltopdf')
  spec.description   = %q(Export html or xhtml file to pdfs with 'wkhtmltopdf')
  spec.homepage      = 'https://github.com/agilecreativity/html2pdf'
  spec.license       = 'MIT'
  spec.files         = Dir.glob('{bin,lib}/**/*') + %w(Gemfile
                                                       Rakefile
                                                       html2pdf.gemspec
                                                       README.md
                                                       CHANGELOGS.md
                                                       LICENSE
                                                       .rubocop.yml
                                                       .gitignore
                                                       rubocop-todo.yml)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('{test}/**/*')
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'agile_utils', '~> 0.0.9'
  spec.add_runtime_dependency 'code_lister', '~> 0.0.8'
  spec.add_development_dependency 'awesome_print', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-minitest', '~> 2.2'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rubocop', '~> 0.20'
  spec.add_development_dependency 'yard', '~> 0.8'
end
