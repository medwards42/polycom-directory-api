require 'data_mapper'


class Directory
  include DataMapper::Resource
  property  :id,          Serial
  property  :extension,    String, :length => 2048
  property  :ln,          String
  property  :fn,          String
  property  :ct,          String
  property  :sd,          Integer
  property  :bw,          Boolean
  property  :created_at,  DateTime

  
end