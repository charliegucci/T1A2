#gems gallore!!!
require "tty-prompt" 
require "tty-font"
require "pastel"
require "tty-box"
require "tty-spinner"
require "./Breeder"
require "tty-table"
require "launchy"
require 'yaml'
# initialize some gems
prompt = TTY::Prompt.new
pastel = Pastel.new
font = TTY::Font.new(:doom)
spinner = TTY::Spinner.new("[:spinner] ...Adding")

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
        
        when "Bird Database"
        
            bird_id_tag = prompt.ask("Enter Id tag", required: true) 
            load "spinner.rb"
            bird_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
            load "spinner.rb"
            bird_mutation = prompt.ask("Please type Mutation", required: true) 
            load "spinner.rb"
            bird_sex = prompt.select("Please Select Sex?", %w(Cock Hen)) 
            load "spinner.rb"
            bird_age = prompt.ask("How old?  (months)", required: true) 
            load "spinner.rb"
        
            lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        
            wilson.update_database(lovebird) # Pushes the collected data to an array at the Breeders Class
        
            # tty prompt gem for hitting spacebar or enter to continue
            prompt.keypress("Press space or enter to continue", keys: [:space, :return])
                system("clear") 
        
        when "Bird Genetic Calculator"
            Launchy.open("http://www.gencalc.com/gen/eng_genc.php?sp=0LBpeach")
                system("clear")
        
        when "Bird Tips and Reminder"
                reminder_input = prompt.select("Please Select from the following?") do |menu|
                menu.choice "Write Reminder"
                menu.choice "Open Reminder"  
                menu.choice "Back to Main Menu"
            end
                case reminder_input
                    when "Write Reminder"
                        puts "...notes here"
                        new_reminder = gets.chomp
                        File.open("reminder.txt", "a") { |file| file.write(new_reminder + "%#&") }
                    when "Open Reminder"
                        reminder = File.read("reminder.txt")
                        reminders = reminder.split("%#&")
                        reminders.each do |element|
                        puts element
                    end
                prompt.keypress("Press space or enter to continue", keys: [:space, :return])
                system("clear")
        end
            
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
    system("clear")
end
