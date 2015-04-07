source 'https://rubygems.org'

gem 'rails',                  '4.1.8'
gem 'sass-rails'
gem 'uglifier',               '2.5.3'
gem 'coffee-rails',           '4.1.0'
gem 'jquery-rails',           '3.1.2'
gem 'turbolinks',             '2.5.2'
gem 'jbuilder',               '2.2.5'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'mysql2'

gem "devise"
gem "foreigner"
gem "brazilian-rails"
gem "friendly_id"
gem "httparty"
gem "sitemap_generator"
gem "date_validator"
gem "paperclip"
gem "foreman"
gem "cancancan"
gem "baseinocode-rails", git: "git@bitbucket.org:inocode/baseinocode-rails.git"
gem 'simple_form',            '3.1.0'
gem 'missing_validators'

group :assets do
  gem "compass-rails"
  gem "kaminari-bootstrap"
  gem "dropzonejs-rails"
end

group :production, :staging do
  gem 'newrelic_rpm',         '3.9.7.266'
end

group :development do
  gem 'spring',               '1.2.0'
  gem 'letter_opener',        '1.2.0'
  gem 'bullet',               '4.14.0'
  gem 'quiet_assets',         '1.0.3'
end

group :test do
  gem 'shoulda-matchers',     '2.7.0', require: false
  gem 'simplecov',            '0.9.1', require: false
  gem 'email_spec',           '1.6.0'
  gem 'capybara',             '2.4.4'
  gem 'poltergeist',          '1.5.1'
  gem 'vcr',                  '2.9.3'
  gem 'webmock',              '1.20.4'
  gem 'database_cleaner',     '1.3.0'
  gem "rubycritic",                    require: false, git: "https://github.com/whitesmith/rubycritic.git"
end

group :development, :test do
  gem 'rspec-rails',          '3.1.0'
  gem 'factory_girl_rails',   '4.5.0'
  gem 'pry-rails',            '0.3.2'
  gem 'dotenv-rails',         '1.0.2'
  gem 'awesome_print',        '1.2.0'
  gem "brfaker"
end