#gems gallore!!!
load "progress.rb"
require "./module"
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
# spinner = TTY::Spinner.new("[:spinner] ...Adding")




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
    options = "Add Bird to Database", "Bird Colour Calculator", "Reminder", "List of Stocks", "Exit"
    user_input = prompt.select("Please Enter Information Below:", options, filter: true) 
         
    
    case user_input
        
        when "Add Bird to Database"
        
            bird_id_tag = prompt.ask("Enter Id tag", required: true) 
            show_spinner
            bird_type = prompt.select("Please Select type?", %w(Whitefaced Peachfaced Orangeface))
            show_spinner
            options = "Green", "Green/Violet", "Blue", "Violet", "Cinnamon", "Lutino",
            "Cremino", "Opaline", "Slate Aqua", "Turquiose", "Pallid", "PaleHeaded", "Fallow", "Pied", "Edge", "Dilute"
            bird_mutation = prompt.select("Please Select from the following?", options, filter: true)
            show_spinner
            bird_sex = prompt.select("Please Select Sex?", %w(Cock Hen)) 
            show_spinner
            bird_age = prompt.select("Please Select Age (in months)?", %w(1 2 3 4 5 6 6 7 8 9 10 11 12)) 
            show_spinner
        
            lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        
            wilson.update_database(lovebird) # Pushes the collected data to an array at the Breeders Class
        
            pause
        
        when "Bird Colour Calculator" # Link to a website 
            load "progress.rb"
            Launchy.open("http://www.gencalc.com/gen/eng_genc.php?sp=0LBpeach")
                system("clear")
        
        when "Reminder"
            reminder_option = "Write Reminder", "Open Reminder", "Delete Reminder", "Back to Main Menu"
            reminder_input = prompt.select("Please Select from the following?", reminder_option) 
               
                case reminder_input
                    when "Write Reminder"
                        notes.writing_reminder
                    when "Open Reminder"
                        notes.list_reminder = YAML.load(File.read("@list_reminder.yml"))    
                        box = TTY::Box.error("You don't have any saved Data")
                        if notes.list_reminder.all? &:nil? 
                        print box    
                            pause
                        else
                           notes.opening_reminder
                        pause
                        end
                               
                        
                    when "Delete Reminder"
                        notes.list_reminder = YAML.load(File.read("@list_reminder.yml"))    
                        box = TTY::Box.error("You don't have any saved Data")
                        if notes.list_reminder.all? &:nil? 
                            print box
                            pause
                            else
                                notes.deleting_reminder
                            end
                        end
                    
        when "List of Stocks"
        show_spinner2
        list_option = "Display Stocks", "Delete Stocks", "Back to Main Menu"
        list_input = prompt.select("Please Select from the following?", list_option, filter: true) 
                
                case list_input
                    when "Display Stocks"
                        wilson.collection = YAML.load(File.read("@collection.yml"))
                        box = TTY::Box.error("You don't have any saved Data")
                        if wilson.collection.all? &:nil?
                            print box
                        else
                            wilson.list_stocks

                        end
                        pause
                    when "Delete Stocks"
                        wilson.collection = YAML.load(File.read("@collection.yml"))    
                        box = TTY::Box.error("You don't have any saved Data")
                        if wilson.collection.all? &:nil? 
                            print box
                            pause
                            else
                                wilson.delete_stocks
                            end
                    else        
                end
        
        when "Exit"
            user_input = prompt.yes?('Are you sure you want to Quit?')
            not_quiting = true if user_input
        system("clear")
          
    end
    system("clear")
end
