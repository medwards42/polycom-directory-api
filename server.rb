%w(sinatra data_mapper json builder ./lib/directory.rb).each  { |lib| require lib}


class Server < Sinatra::Base
  
  
  DataMapper::Logger.new($stdout, :info)
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "mysql://root:#{ENV['DB_PWD'] || 'password'}@localhost/directory.feco.net_development")

  configure :test do
    DataMapper.setup(:default, "mysql://root:#{ENV['DB_PWD'] || 'password'}@localhost/directory.feco.net_development")
    DataMapper.auto_migrate!
  end

  DataMapper.auto_migrate!
  DataMapper.finalize


  error do
    content_type :json
    status 500

    e = env['sinatra.error']
    {:status => 500, :message => e.message}.to_json
  end

  not_found do
    status 404
    'These are not the droids you\'re looking for.' +
    '<br>It would appear that you either forgot to add an extension as a parameter,' +
    '<br>or you did not post any data for processing.' +
    '<br><br>In any case you should probably refer to the <a href="https://github.com/medwards42/polycom-directory-api" target="_blank">README</a>.'
  end

  get '/health_check' do
    status 200
    begin
      "All Systems Go!"
    rescue Exception => e
      raise "Connection to DB not yet working!"
    end


  end

  get '/' do
    raise(Sinatra::NotFound)  if params.empty?
  end

  get '/*-directory.*' do
    status 200
    @mac = params[:splat][0].to_s
    @fileExtension = params[:splat][1].to_s
    @file = JSON.parse(File.read(DirectoryFile), :symbolize_names => true)[:extensions].find { |e| e[:mac] == @mac }
    if @file == nil
     status 500
     body "Extension does not exist."
    else
      case @fileExtension
      when "xml"
        content_type :xml
        "#{@file.to_xml(:root => "Directory", :children => "item", :skip_types => true, :dasherize => false)}"
      when "json"
        content_type :json
        "#{@file.to_json}"
      end
    end
  end
end
