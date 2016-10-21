require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './link.rb'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag, String

  has n, :links, through: Resource

end
