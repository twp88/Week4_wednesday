
def data_mapper_setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
