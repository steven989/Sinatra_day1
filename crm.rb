require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'


@@contact_array = []

@@rolodex = Rolodex.new
@@crm_app_name = "My CRM"
@@current_time = Time.now

get '/' do

    erb :index
    
end

get '/contacts' do

    @@contact_array = []
    @@rolodex.view_all_contacts
    puts "Check point 1-------------------------------"
    puts @@contact_array.inspect
    puts "-------------------------------"
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

get '/contacts/:id/delete' do

    id = params[:id][1..-1].to_i
    @@rolodex.delete_a_contact(id)
    redirect to ('/contacts')

end 

post '/contacts' do

    @@rolodex.add_contact(params[:first_name],params[:last_name],params[:email],params[:notes])
    redirect to('/contacts')
end