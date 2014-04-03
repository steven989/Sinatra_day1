require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'


@@contact_array = []

get '/' do

    @crm_app_name = "My CRM"
    @current_time = Time.now
    @@rolodex = Rolodex.new
    erb :index
    
end

get '/contacts' do

    @@rolodex.view_all_contacts

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

post '/contacts' do

    @@rolodex.add_contact(params[:first_name],params[:last_name],params[:email],params[:notes])
    redirect to('/contacts')
end