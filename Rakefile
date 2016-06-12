task :test do
  ENV['RACK_ENV'] = 'test'
  exec 'cutest test/**/*_test.rb'
end

task default: :test
