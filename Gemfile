source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf',  '~> 3.1'
  gem 'chefspec',   '~> 4.0'
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',    '~> 0.23'

  gem 'test-kitchen',    '~> 1.3'
  gem 'kitchen-ec2',
      github: 'test-kitchen/kitchen-ec2',
      tag: '12b7719'
end

group :test, :vagrant do
  gem 'kitchen-vagrant', '~> 0.15'
end
