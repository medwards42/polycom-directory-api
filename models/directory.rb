require 'data_mapper'


class Directory
  include DataMapper::Resource
  property  :id,          Serial
  property  :extension,   String, :length => 10
  property  :mac_address, String, :length => 12
  property  :ln,          String
  property  :fn,          String
  property  :ct,          String
  property  :sd,          Integer
  property  :bw,          Boolean, :default => false
  property  :created_at,  DateTime


end
