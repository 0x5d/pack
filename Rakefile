task :test do
  ENV['RACK_ENV'] = 'test'
  exec 'cutest test/**/*.rb'
end

task default: :test
