require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/trackSite.rb'

get '/' do
  @track = TrackHelper.new
  erb :index
end