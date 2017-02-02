require 'bundler'
Bundler.require(:default)

require 'http_stub_docker/rake/task_generator'

require_relative 'lib/http_stub_example'

begin
  Bundler.require(:development)
  require 'rubocop/rake_task'

  desc "Source code metrics analysis"
  RuboCop::RakeTask.new(:metrics) { |task| task.fail_on_error = true }
rescue LoadError
  # Not required to start server
end

HttpStubDocker::Rake::TaskGenerator.new(configurer:   HttpStubExample::Configurer,
                                        stub_name:    :http_stub_example,
                                        stub_dir:     File.expand_path("..", __FILE__),
                                        publish_tags: [ "1.0.#{ENV["BUILD_NUMBER"]}", "latest" ])

namespace :ci do

  task :validate do
    print " Travis CI Validation ".center(80, "*") + "\n"
    result = `travis-lint #{::File.expand_path('../.travis.yml', __FILE__)}`
    puts result
    print "*" * 80+ "\n"
    raise "Travis CI validation failed" unless $?.success?
  end

end

task default: %w{ metrics docker:setup docker:commit ci:validate }

task commit: %w{ metrics docker:commit }
