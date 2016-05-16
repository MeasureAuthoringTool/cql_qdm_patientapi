source 'https://rubygems.org'

gem 'sprockets'
gem 'coffee-script'
gem 'uglifier'
gem 'rake'

group :test do
  gem 'minitest'
  gem 'turn', :require => false

  platforms :ruby do
    gem "libv8" 
    gem "therubyracer", :require => 'v8'
  end
end