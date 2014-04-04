require 'sinatra'
require_relative 'rolodex'
require 'data_mapper'


DataMapper.setup(:default, "sqlite3:database.sqlite3")


class Contact

    include DataMapper::Resource

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :email, String
    property :notes, String


                              # attr_accessor :first_name, :last_name, :email, :notes, :id

                              # @@counter = 0

                              # def initialize(first_name,last_name,email,notes)

                              #   @@counter += 1  #increment the ID by one
                                
                              #   @id = @@counter
                              #   @first_name = first_name
                              #   @last_name = last_name
                              #   @email = email
                              #   @notes = notes

                              # end



end

DataMapper.finalize
DataMapper.auto_upgrade!


@@contact_array = []

@@rolodex = Rolodex.new
@@crm_app_name = "My CRM"
@@current_time = Time.now

get '/' do

    erb :index
    
end

get '/contacts' do


    @contact_array = Contact.all
    # @@rolodex.view_all_contacts
    erb :contacts
    
end

get '/contacts/new' do

    erb :contact_new
    
end



get '/contacts/find_all' do

    erb :contact_view_one
    
end

post '/contacts/find_all' do

    @@filtered_array = []
    first_name = params[:first_name] == "" ? "|~@|@|@|@|@|@|@|@|@+++|xxefaw||aew|" : params[:first_name]    #The random string of text is so that when nothing is entered, the program is not matching "", which will match to anything
    last_name = params[:last_name] == "" ? "|~@|@|@|@|@|@|@|@|@+++|xxefaw||aew|" : params[:last_name]
    email = params[:email] == "" ? "|~@|@|@|@|@|@|@|@|@+++|xxefaw||aew|" : params[:email]
    notes = params[:notes] == "" ? "|~@|@|@|@|@|@|@|@|@+++|xxefaw||aew|" : params[:notes]

    @@rolodex.view_all_by_attr_value(first_name,last_name,email,notes)

    erb :filtered_contacts

end


get '/contacts/:id/edit' do

    @id = params[:id].to_i

    @@first_name_formdefault = ""
    @@last_name_formdefault = ""
    @@email_formdefault = ""
    @@notes_formdefault = ""


    @@rolodex.view_a_contact(@id)

    erb :contact_modify
    
end

post '/contacts/:id/edit' do

    @first_name=params[:first_name]
    @last_name=params[:last_name]
    @email=params[:email]
    @notes=params[:notes]
    @id=params[:id]


    @@rolodex.modify_contact(@id.to_i,@first_name,@last_name,@email,@notes)

    redirect to('/contacts')

end


get '/contacts/:id/delete' do

    id = params[:id].to_i
    Contact.get(id).destroy
    redirect to ('/contacts')

end 

get '/contacts/delete_all' do

    @@rolodex.delete_all_contacts
    redirect to ('/contacts')

end

post '/contacts' do

    Contact.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        notes: params[:notes])

    redirect to('/contacts')
end




