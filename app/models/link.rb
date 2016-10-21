require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './tags.rb'
require_relative './data_mapper_setup'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

  has n, :tags, through: Resource
end


data_mapper_setup
