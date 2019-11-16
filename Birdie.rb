#gems gallore!!!
# load "progress.rb"
require "./spinner"
require "tty-prompt" 
require "tty-font"
require "pastel"
require "tty-box"
require "tty-spinner"
require "./breeder"
require "tty-table"
require "launchy"
require 'yaml'
require "./reminder"
# initialize some gems
system("clear")
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
notes = Reminder.new
wilson = Breeder.new
not_quiting = false
until not_quiting do
    
    puts pastel.red(font.write("BIRDIE")) # TTY-FOnt for the Heading
            # Uses TTY-Prompt Gem for the Menus
    options = "Bird Database", "Bird Genetic Calculator", "Reminder", "List All Stocks", "Exit"
    user_input = prompt.select("Please Select from the following?", options, filter: true) 
    
    case user_input
        
        when "Bird Database"
        
            bird_id_tag = prompt.ask("Enter Id tag", required: true) 
            show_spinner()
            bird_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
            show_spinner()
            bird_mutation = prompt.ask("Please type Mutation", required: true) 
            show_spinner()
            bird_sex = prompt.select("Please Select Sex?", %w(Cock Hen)) 
            show_spinner()
            bird_age = prompt.ask("How old?  (months)", required: true) 
            show_spinner()
        
            lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        
            wilson.update_database(lovebird) # Pushes the collected data to an array at the Breeders Class
        
            # tty prompt gem for hitting spacebar or enter to continue
            prompt.keypress("Press space or enter to continue", keys: [:space, :return])
                system("clear") 
        
        when "Bird Genetic Calculator"
            Launchy.open("http://www.gencalc.com/gen/eng_genc.php?sp=0LBpeach")
                system("clear")
        
        when "Reminder"
                reminder_option = "Write Reminder", "Open Reminder", "Delete Reminder", "Back to Main Menu"
                reminder_input = prompt.select("Please Select from the following?", reminder_option, filter: true) 
                
                case reminder_input
                    when "Write Reminder"
                        # box = TTY::Box.info("Reminder Section")
                        # print box
                        # new_reminder = prompt.ask("Please type your notes here...", required: true)
                        # File.open("reminder.txt", "a") { |file| file.write(new_reminder + "%#&") }
                        notes.writing_reminder
                    when "Open Reminder"
                        reminder = File.read("reminder.txt")
                        reminders = reminder.split("%#&")
                        reminders.each do |element|
                            box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3, title: {top_left: "NOTES",
                                 bottom_right: 'wilson® v1.0'}, style: {fg: :bright_yellow, # TTY-BOX for the Reminder section
                                bg: :blue, border: {fg: :bright_yellow, bg: :blue}}) do
                                "#{element}"
                              end   
                              print box 
                            end
                    when "Delete Reminder"
                        reminder = File.read("reminder.txt")
                        reminders = reminder.split("%#&")
                        reminders.each do |element|
                            box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3, title: {top_left: "NOTES",
                                 bottom_right: 'wilson® v1.0'}, style: {fg: :bright_yellow, # TTY-BOX for the Reminder section
                                bg: :blue, border: {fg: :bright_yellow, bg: :blue}}) do
                                "#{element}"
                              end   
                              print box 
                        end
                        puts " Which note you want to delete? (eg. 1...10)"
                        user_delete_input = gets.chomp.to_i
                        reminders.slice!(user_delete_input - 1)
                        
                        File.open("reminder.txt", "w") { |file| file.write(reminders.join("%#&")) }
                        box = TTY::Box.warn("Deleted Selected Notes")
                        print box
                    
                    end
                    prompt.keypress("Are you sure you want to continue? Press space or enter ", keys: [:space, :return])
                    system("clear")
                
            
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
