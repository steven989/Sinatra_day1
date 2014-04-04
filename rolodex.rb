
class Rolodex


  def initialize

    @rolodex = []

    @rolodex << Contact.new("Steve","Long","steven989@gmail.com","He is a pretty rad guy.") #default value
    @rolodex << Contact.new("Mike","Smith","michael.smith@universe.com","Met him a few days ago.") #default value
    @rolodex << Contact.new("Joey","Ionian","j.ionian@college.ca","He came to me") #default value
    @rolodex << Contact.new("Sandra","Stevenson","sandra.stevenson@web.ca","She is also awesome") #default value
  end

####################################### method to add a contact
  def add_contact(first_name,last_name,email,notes)

    contact = Contact.new(first_name,last_name,email,notes)
    puts "Check point 0"
    @rolodex << contact
  end

####################################### method to modify a contact
  def modify_contact(id,first_name,last_name,email,notes)

    @rolodex.each{ |contact|

      if contact.id == id
        
          contact.first_name = first_name

          contact.last_name = last_name

          contact.email = email
        
          contact.notes = notes

      end

    }
  end

####################################### method to view all contacts
  def view_all_contacts

    @rolodex.each {|contact|
      @@contact_array << contact
    }


  end

####################################### method to view a specific contact by ID
  def view_a_contact(id)

    @rolodex.each{|contact|

      if contact.id == id

        @@first_name_formdefault = contact.first_name
        @@last_name_formdefault = contact.last_name
        @@email_formdefault = contact.email
        @@notes_formdefault = contact.notes

      end
    }
  end

####################################### method to view all contacts by attribute value
  def view_all_by_attr_value(first_name,last_name,email,notes)


        @rolodex.each {|contact|

          if contact.first_name.downcase.include? (first_name.downcase) or contact.last_name.downcase.include? (last_name.downcase) or contact.email.downcase.include? (email.downcase) or contact.notes.downcase.include? (notes.downcase)
            @@filtered_array << contact

          end

        }
      

  end

####################################### method to delete a specific contact by ID
  def delete_a_contact(id)

    @rolodex.delete_if {|contact|

      contact.id == id

    }

  end


####################################### method to delete all contacts that fit a criteria
  def delete_by_attr_value(attribute,value,type)

      total_delete = 0

      if type == 1

          if attribute.downcase == "first name"

            total_delete = (@rolodex.find_all {|contact|
              contact.first_name.downcase == value.downcase
            }).length

            @rolodex.delete_if {|contact|
              contact.first_name.downcase == value.downcase
            }
          
          elsif attribute.downcase == "last name"

            total_delete = (@rolodex.find_all {|contact|
              contact.last_name.downcase == value.downcase
            }).length

            @rolodex.delete_if {|contact|
              contact.last_name.downcase == value.downcase
            }

          elsif attribute.downcase == "email"

            total_delete = (@rolodex.find_all {|contact|
              contact.email.downcase == value.downcase
            }).length


            @rolodex.delete_if {|contact|
              contact.email.downcase == value.downcase
            }

          elsif attribute.downcase == "notes"

            total_delete = (@rolodex.find_all {|contact|
              contact.notes.downcase == value.downcase
            }).length

            @rolodex.delete_if {|contact|
              contact.notes.downcase == value.downcase
            }

          end # this end is for the test of attribute within exact match

      else  # this else is for the test for 1 or 2 (matching type)

          if attribute.downcase == "first name"

            total_delete = (@rolodex.find_all {|contact|
              contact.first_name.downcase.include? (value.downcase) 
            }).length

            @rolodex.delete_if {|contact|
              contact.first_name.downcase.include? (value.downcase) 
            }
          
          elsif attribute.downcase == "last name"

            total_delete = (@rolodex.find_all {|contact|
              contact.last_name.downcase.include? (value.downcase) 
            }).length

            @rolodex.delete_if {|contact|
              contact.last_name.downcase.include? (value.downcase) 
            }

          elsif attribute.downcase == "email"

            total_delete = (@rolodex.find_all {|contact|
              contact.email.downcase.include? (value.downcase) 
            }).length

            @rolodex.delete_if {|contact|
              contact.email.downcase.include? (value.downcase) 
            }

          elsif attribute.downcase == "notes"

            total_delete = (@rolodex.find_all {|contact|
              contact.notes.downcase.include? (value.downcase) 
            }).length

            @rolodex.delete_if {|contact|
              contact.notes.downcase.include? (value.downcase) 
            }

          end



      end   # this end is for the test for 1 or 2 (matching type)

      puts "#{total_delete} contacts have been deleted!"

  end

####################################### method to delete all contacts

  def delete_all_contacts

    @rolodex = []


  end





end