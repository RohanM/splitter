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
DataMapper.finalize


# -- Filters

before do
  if params.key? 'split_experiment' and params.key? 'split_source'
    SplitData.create(:experiment => params['split_experiment'], :path => request.path_info, :source => params['split_source'])
  end
end

# -- Views

get '/' do
  haml (rand > 0.5 ? :index_a : :index_b)
end

get '/action' do
  haml :action
end
