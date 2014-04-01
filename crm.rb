require 'sinatra'
require_relative 'contact'

get '/' do

    @crm_app_name = "My CRM"
    @current_time = Time.now
    erb :index
    
end

get '/contacts' do

    @contacts = []

    @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
    @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
    @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")


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

    puts params

end