
class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id

  @@counter = 0

  def initialize(first_name,last_name,email,notes)

    @@counter += 1  #increment the ID by one
    
    @id = @@counter
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes

  end



end