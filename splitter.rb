require 'rubygems'
require 'sinatra'
require 'data_mapper'

# -- Model

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/splitter.db")

class SplitData
  include DataMapper::Resource

  property :id, Serial
  property :experiment, String
  property :path, String
  property :source, String
end

SplitData.auto_migrate! unless SplitData.storage_exists?


# -- Views

get '/' do
  haml (rand > 0.5 ? :index_a : :index_b)
end
