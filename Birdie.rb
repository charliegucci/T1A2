#gems
require "tty-prompt"
require "tty-font"
require "pastel"
require "tty-box"
require "tty-spinner"
require "./Breeder"

prompt = TTY::Prompt.new
pastel = Pastel.new
font = TTY::Font.new(:doom)




class Bird 
        attr_accessor :id_tag, :mutation, :sex, :age, :type
        
        def initialize(id_tag, type, mutation, sex, age)
            @id_tag = id_tag
            @type = type
            @mutation = mutation
            @sex = sex
            @age = age
        end
    
        def adding_bird

            "bird added"
        end
    
end
wilson = Breeder.new
 
not_quiting = false
until not_quiting do
    pastel = Pastel.new
    
    puts pastel.red(font.write("BIRDIE"))
    
    user_input = prompt.select("Please Select from the following?") do |menu|
        menu.choice "Bird Database"
        menu.choice "Bird Genetic Calculator"
        menu.choice "Bird Tips and Reminder"
        menu.choice "List All Stocks"
        menu.choice "Exit"
    end
    
    
    case user_input
        
        
    when "Bird Database"
        bird_id_tag = prompt.ask("Enter Id tag", convert: :string) #tty prompt
        bird_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
        bird_mutation = prompt.ask('Whats the Mutation? (include everything)') do |q| #tty prompt
            q.convert -> (input) { input.split(/,\s*/) } #tty prompt
        end
        bird_sex = prompt.select("Please Select Sex?", %w(Cock Hen)) #tty prompt
        bird_age = prompt.ask("How old?  (months)", convert: :int) #tty prompt
        
        lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        puts lovebird.id_tag
        puts lovebird.type
        puts lovebird.mutation
        puts lovebird.sex
        puts lovebird.age
        
        wilson.update_database(lovebird) #working
        
        
        
        
        # tty prompt gem for hitting spacebar or enter to continue
        prompt.keypress("Press space or enter to continue", keys: [:space, :return])
        system("clear") 
        
        
    when "Bird Genetic Calculator"
    when "Bird Tips and Reminder"
    when "List All Stocks"
        spinner = TTY::Spinner.new("[:spinner] Checking the stocks. Please Wait ...", format: :bouncing_ball)
        spinner.auto_spin 
        sleep(1) 
        spinner.stop('Done!')
        
        
         wilson.list_stocks 
        
        

    when "Exit"
        not_quiting = true
    end
    
end


