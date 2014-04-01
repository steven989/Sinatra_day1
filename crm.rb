require 'sinatra'

get '/' do

    @crm_app_name = "My CRM"
    @current_time = Time.now
    erb :index
    
end

get '/contacts' do

    erb :contacts
    
end


