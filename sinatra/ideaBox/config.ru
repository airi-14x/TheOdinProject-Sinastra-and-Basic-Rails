$:.unshift File.expand_path("./../lib", __FILE__)
require 'bundler'
Bundler.require

#require './app' # Require/run the file: is similar to C's 'include'
require 'app'

run IdeaBoxApp
