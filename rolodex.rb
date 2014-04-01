
class Rolodex


  def initialize

    @rolodex = []

  end

####################################### method to add a contact
  def add_contact(first_name,last_name,email,notes)

    contact = Contact.new(first_name,last_name,email,notes)
    @rolodex << contact
  end

####################################### method to modify a contact
  def modify_contact(id,attribute,value)

    @rolodex.each{ |contact|

      if contact.id == id
        
        if attribute.downcase == "first name"
          contact.first_name = value
        elsif attribute.downcase == "last name"
          contact.last_name = value
        elsif attribute.downcase == "email"
          contact.email = value
        elsif attribute.downcase == "notes"
          contact.notes = value
        end

      end

    }
  end

####################################### method to view all contacts
  def view_all_contacts


    @rolodex.each {|contact|
      puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
      puts "--------------------------------"
    }

  end

####################################### method to view a specific contact by ID
  def view_a_contact(id)

    @rolodex.each{|contact|

      if contact.id == id

      puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
      puts "--------------------------------"
      end
    }
  end

####################################### method to view all contacts by attribute value
  def view_all_by_attr_value(attribute,value)

      if attribute.downcase == "first name"

        @rolodex.each {|contact|

          if contact.first_name.downcase.include? (value.downcase)
          puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
          puts "--------------------------------"
          end

        }
      
      elsif attribute.downcase == "last name"

        @rolodex.each {|contact|

          if contact.last_name.downcase.include? (value.downcase)
          puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
          puts "--------------------------------"
          end

        }

      elsif attribute.downcase == "email"

        @rolodex.each {|contact|

          if contact.email.downcase.include? (value.downcase)
          puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
          puts "--------------------------------"
          end

        }

      elsif attribute.downcase == "notes"

        @rolodex.each {|contact|

          if contact.notes.downcase.include? (value.downcase)
          puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
          puts "--------------------------------"
          end

        }

      end


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

    puts "The contacts have been cleared!"

    sleep(0.2)

  end





end