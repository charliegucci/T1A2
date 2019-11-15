#gems
require "tty-prompt"
require "tty-font"
require "pastel"
require "tty-box"
require "tty-spinner"
require "./Breeder"
require "tty-table"
require "launchy"
require 'yaml'

prompt = TTY::Prompt.new
pastel = Pastel.new
font = TTY::Font.new(:doom)
pastel = Pastel.new

class Bird 
        attr_accessor :id_tag, :mutation, :sex, :age, :type
        
        def initialize(id_tag, type, mutation, sex, age)
            @id_tag = id_tag
            @type = type
            @mutation = mutation
            @sex = sex
            @age = age
        end
    
end

def adding_spinner
    spinner.auto_spin
    sleep(1)
    spinner.success('(successful)')
    
end

wilson = Breeder.new

 
not_quiting = false
until not_quiting do
    
    
    puts pastel.red(font.write("BIRDIE")) # TTY-FOnt for the Heading
            # Uses TTY-Prompt Gem for the Menus
    user_input = prompt.select("Please Select from the following?") do |menu|
        menu.choice "Bird Database"
        menu.choice "Bird Genetic Calculator"
        menu.choice "Bird Tips and Reminder"
        menu.choice "List All Stocks"
        menu.choice "Exit"
    end
    
    
    case user_input
        
                # Uses TTY-Prompt Gem to collect data
        when "Bird Database"
        spinner = TTY::Spinner.new("[:spinner] ...Adding")
        bird_id_tag = prompt.ask("Enter Id tag", convert: :string) 
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')
        
        bird_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')
        
        bird_mutation = prompt.ask("Please type Mutation", convert: :string) 
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')
        
        bird_sex = prompt.select("Please Select Sex?", %w(Cock Hen)) 
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')
        
        bird_age = prompt.ask("How old?  (months)", convert: :int) 
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')
        lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        
        wilson.update_database(lovebird) # Pushes the collected data to an array at the Breeders Class
        
        # tty prompt gem for hitting spacebar or enter to continue
        prompt.keypress("Press space or enter to continue", keys: [:space, :return])
        system("clear") 
        
        
        when "Bird Genetic Calculator"

            Launchy.open("http://www.gencalc.com/gen/eng_genc.php?sp=0LBpeach")
        # wilson.update_database(lovebird)   
        # puts "Please add details for the Cock Bird"
        # male_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface)) 
        # spinner = TTY::Spinner.new("[:spinner] ...Adding")
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')
        
        # male_colour1 = prompt.ask("Please type Colour", convert: :string)
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')
        
        # male_colour2 = prompt.ask("Please type Secondary Colour", convert: :string) 
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')

        # puts "Please add details for the Hen Bird"

        # female_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface)) 
        # spinner = TTY::Spinner.new("[:spinner] ...Adding")
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')
        
        # female_colour1 = prompt.ask("Please type Colour", convert: :string)
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')
        
        # female_colour2 = prompt.ask("Please type Secondary Colour", convert: :string) 
        # spinner.auto_spin
        # sleep(1)
        # spinner.success('(successful)')
        
        # wilson.gen_calculator(male_colour1, male_colour2, male_type, female_colour1, female_colour2,
        # female_type
        # )
        
        when "Bird Tips and Reminder"
        when "List All Stocks"
        spinner = TTY::Spinner.new("[:spinner] Checking the stocks. Please Wait ...", format: :bouncing_ball)
        spinner.auto_spin 
        sleep(1) 
        spinner.stop('Done!')
        
        wilson.list_stocks
        
        prompt.keypress("Press space or enter to continue", keys: [:space, :return])
        system("clear")
        
        when "Exit"
            user_input = prompt.yes?('Are you sure you want to Quit?')
            not_quiting = true if user_input
        system("clear")
          
    end
    
end
