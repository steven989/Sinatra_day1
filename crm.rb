require 'sinatra'

get '/' do

    @crm_app_name = "My CRM"
    @current_time = Time.now
    erb :index
    
end

get '/contacts' do

    erb :contacts
    
end

get '/contacts/new' do

    erb :contact_new
    
end


get '/contacts/:id' do

    erb :contact_view_one
    
end

get '/contacts/:id/edit' do

    erb :contact_modify
    
end