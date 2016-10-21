require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './data_mapper_setup'

class User_deets

  include DataMapper::Resource
  property :id, Serial
  property :user_name, String
  property :email, String
  property :password, String

  has n, :links, through: Resource


end

data_mapper_setup
