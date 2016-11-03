require 'bundler'
Bundler.require(:default)

require 'http_stub_docker/rake/task_generator'

require_relative 'lib/http_stub_example'

HttpStubDocker::Rake::TaskGenerator.new(configurer: HttpStubExample::Configurer,
                                        stub_name:  :http_stub_example,
                                        stub_dir:   File.expand_path("..", __FILE__),
                                        version:    "1.0.0")

task default: "docker:commit"
