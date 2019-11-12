require "tty-prompt"
prompt = TTY::Prompt.new

class Breeder
    def initialize
        @collection = []
    end
    def update_database
        @collection.push(Bird.new)

    end

end
user = Breeder.new
class Bird
    attr_accessor :type, :mutation, :sex, :age
    def initialize
        # @parent_cock = ""
        # @parent_hen = ""
        
    end
    
    def adding_bird(type, mutation, sex, age)
        @type = type
        @mutation = mutation
        @sex = sex
        @age = age
        @id_tag = rand(1..100)
        

    end


end

wilson = Bird.new

user_input = prompt.select("Please Select from the following?") do |menu|
    menu.choice "Bird Database"
    menu.choice "Bird Genetic Calculator"
    menu.choice "Bird Tips and Reminder"
    menu.choice "Exit"
  end

  not_quiting = false
  until not_quiting do

case user_input
    
    when "Bird Database"
        user_input1 = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
        user_input2 = prompt.ask("Please type the exact mutation", required: true)
        user_input3 = prompt.select("Please Select Sex?", %w(Cock Hen))
        user_input4 = prompt.ask("How old?", convert: :int)
        wilson.adding_bird(user_input1, user_input2, user_input3, user_input4)
        puts "Added #{wilson.type} #{wilson.mutation} #{wilson.sex} Bird"
        
        break
    when "Bird Genetic Calculator"

    when "Bird Tips and Reminder"

    when "Exit"
    not_quiting = true
    end
end

