require 'data_mapper'

# Define the directory model
class Directory
  include DataMapper::Resource
  property  :id,          Serial, :key => false
  property  :extension,   String, :length => 10
  property  :mac_address, String, :length => 12, :key => true, :required => true
  property  :ln,          String
  property  :fn,          String
  property  :ct,          String
  property  :sd,          Integer, :key => true, :required => true
  property  :bw,          Boolean, :default => 0
  property  :created_at,  DateTime


end
