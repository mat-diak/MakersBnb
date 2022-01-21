# frozen_string_literal: true

source "https://rubygems.org"

ruby '3.0.0'

  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'pg'
  gem 'sinatra-flash'

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'rspec'
  gem 'capybara'
end 

group :development, :test do
  gem 'rubocop', '1.20'
end

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'webrick', '~> 1.3', '>= 1.3.1'



