require "tty-prompt"
prompt = TTY::Prompt.new

class Breeder
    
    attr_accessor :collection

    def initialize
        @collection = []
    end
    
    def update_database
        @collection.push(Bird.new)
        "update"
    end
    
    def list_stocks
        
        @collection.each do |x|
            puts x
        end
        "List"
    end

    
end

class Bird
        attr_accessor :id_tag, :mutation, :sex, :age, :type
        
        def initialize
            @id_tag = id_tag
            @type = type
            @mutation = mutation
            @sex = sex
            @age = age
        end
    
        def adding_bird(user_input5, user_input1, user_input2, user_input3, user_input4)

            "bird added"
        end
    
end
 
not_quiting = false
until not_quiting do
    
    user_input = prompt.select("Please Select from the following?") do |menu|
        menu.choice "Bird Database"
        menu.choice "Bird Genetic Calculator"
        menu.choice "Bird Tips and Reminder"
        menu.choice "List All Stocks"
        menu.choice "Exit"
    end
   
    
    case user_input
        
    when "Bird Database"
        user_input5 = prompt.ask("Enter Id tag", convert: :int)
        user_input1 = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
        user_input2 = prompt.ask('Whats the Mutation? (include everything)') do |q|
            q.convert -> (input) { input.split(/,\s*/) }
        end
        user_input3 = prompt.select("Please Select Sex?", %w(Cock Hen))
        user_input4 = prompt.ask("How old?  (months)", convert: :int)
        
        lovebird = Bird.new
        wilson = Breeder.new

            puts lovebird.adding_bird("#{user_input5}","#{user_input1}","#{ user_input2}","#{user_input3}","#{user_input4}")
 # tty prompt gem for hitting spacebar or enter to continue
 prompt.keypress("Press space or enter to continue", keys: [:space, :return])
 system("clear") 
             
        
        when "Bird Genetic Calculator"
        when "Bird Tips and Reminder"
        when "List All Stocks"
             puts   wilson.update_database
               puts wilson.list_stocks
            
        when "Exit"
        not_quiting = true
    end

end

    puts user_input2