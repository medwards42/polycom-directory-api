require 'spec_helper'

describe 'App' do

  describe 'Get /health_check ' do
    it 'should respond with \'All Systems Go!\'' do
      get '/health_check' 
      last_response.body.should == 'All Systems Go!'
    end
  end
  
  describe 'Get /' do
    it 'should return a 404 status' do
      get '/'
      last_response.status.should == 404
    end
  end
  
  describe 'Get /2505 ' do
    it 'should return a valid json document' do
      get '/2505'
      last_response.original_headers["Content-Type"].should == 'application/json;charset=utf-8'
    end
  end

end
