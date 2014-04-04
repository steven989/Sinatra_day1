require 'sinatra'
require 'data_mapper'


DataMapper.setup(:default, "sqlite3:database.sqlite3")


class Contact

    include DataMapper::Resource

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :email, String
    property :notes, String
    property :create_date, Date
    property :modify_date, Date


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

@@crm_app_name = "Listr"
@@current_time = Time.now

get '/' do

    @contact_count = Contact.count
    erb :index
    
end

get '/contacts' do

    @contact_count = Contact.count
    @contact_array = Contact.all
    erb :contacts
    
end

get '/contacts/new' do

    @contact_count = Contact.count
    erb :contact_new
    
end



get '/contacts/find_all' do

    @contact_count = Contact.count
    erb :contact_view_one
    
end

post '/contacts/find_all' do

    @contact_count = Contact.count
    @filtered_array = 
        Contact.all(:first_name.like => "%#{params[:search]}%") + # "+" is used like an OR for SQL
        Contact.all(:last_name.like => "%#{params[:search]}%") +
        Contact.all(:email.like => "%#{params[:search]}%") +
        Contact.all(:notes.like => "%#{params[:search]}%")


    erb :filtered_contacts

end


get '/contacts/:id/edit' do

    @contact_count = Contact.count
    @id = params[:id].to_i

    @contact_array = Contact.all #This is so that all the existing contacts are still showing up

    contact = Contact.get(@id)

    @first_name_formdefault = contact.first_name
    @last_name_formdefault = contact.last_name
    @email_formdefault = contact.email
    @notes_formdefault = contact.notes

    erb :contact_modify
    
end

post '/contacts/:id/edit' do

    @first_name=params[:first_name]
    @last_name=params[:last_name]
    @email=params[:email]
    @notes=params[:notes]
    @id=params[:id]

    Contact.get(@id).update(first_name: @first_name, last_name: @last_name, email: @email, notes: @notes, modify_date: Time.now)

    redirect to('/contacts')

end


get '/contacts/:id/delete' do

    id = params[:id].to_i
    Contact.get(id).destroy
    redirect to ('/contacts')

end 

get '/contacts/delete_all' do

    Contact.all.destroy
    redirect to ('/contacts')

end

post '/contacts' do

    Contact.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        notes: params[:notes],
        create_date: Time.now)

    redirect to('/contacts')
end




