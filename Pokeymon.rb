## GEMS!
require "tty-font"
require "pastel"
require "tty-prompt"
require "tty-spinner"

# use tty gem for font and colour
font = TTY::Font.new(:starwars)
pastel = Pastel.new
puts pastel.red(font.write("POKEYMON"))
prompt = TTY::Prompt.new(active_color: :cyan)

class Pokeymon
    
    def initialize
        
        @pokeydex = ["Bulbasaur", "Ivysaur", "Venusaur"] #tested 3 names for now
        @happiness = 50
        @hunger = 0
        @catched_pokeymon = []
        
    end
        def catched_pokeymon
                @catched_pokeymon.each do |poky|
                "#{poky}"
            
            end
        end
    
    def catching_pokeymon 
        @pokeyname = @pokeydex[rand(0..2)]
        @catched_pokeymon.push(@pokeyname)
        @health = rand(1..100)
        @pokeymon_level = rand(1..100)
        
        "You randomly catched #{@pokeyname}  #{@health} Health and #{@pokeymon_level} Level"
    end
        # display last catch will use later   
    def info_pokeymon
        
        "Your Pokeymon is #{@pokeyname} Health is #{@health} and your Level is #{@pokeymon_level}"
    end

    def training_pokeymon 
        @pokeymon_level += 5 
        @health += 5 
        @hunger += 5
        @health = 100 if @health >= 100
        @pokeymon_level = 100 if @pokeymon_level >= 100
        "Thats good! #{@pokeyname} level now is #{@pokeymon_level} Health is #{@health}"
    end
    
    def playing_pokeymon
        @hunger += 5
        @happiness += 5
        @happiness = 100 if @happiness >= 100
        " #{@pokeyname} is Happy, Hapiness increase to #{@happiness}"
    end

    def feeding_pokeymon
        @hunger -= 5
        @hunger = 0 if @hunger <= 0
        "Hunger Level is #{@hunger}"
    end
end

## is this ok? its from tty-prompt gem
trainer = prompt.ask('What is your name?', default: "Larry")
trainer = Pokeymon.new

puts "Lets catch your first Pokeymon!"

    # tty spinner gem for suspense
    spinner = TTY::Spinner.new("[:spinner] Looking for pokeymon ...", format: :spin_2)
    spinner.auto_spin 
    sleep(5) 
    spinner.stop('Done!') # Stop animation

    # initial catch 
puts trainer.catching_pokeymon

    not_quiting = false
    until not_quiting do

    # tty prompt gem for hitting spacebar or enter to continue
    prompt.keypress("Press space or enter to continue", keys: [:space, :return])
    system("clear")

                # tty prompt gem for Menu
user_input = prompt.select("Choose your option?") do |menu|
                menu.choice 'Catch Pokeymon'
                menu.choice 'Train Pokeymon'
                menu.choice 'Play Pokeymon'
                menu.choice 'Feed Pokeymon'
                menu.choice 'List of Pokeymon'
                menu.choice 'Exit game'
    end

                case user_input
                    when 'Catch Pokeymon'
                        
                        # tty spinner gem 
                        spinner = TTY::Spinner.new("[:spinner] Looking for Pokeymon ...", format: :bouncing_ball)
                        spinner.auto_spin 
                        sleep(5) 
                        spinner.stop('Done!') # Stop animation
        
                        puts trainer.catching_pokeymon
    
                    when 'Train Pokeymon'
        
                        # tty spinner gem
                        spinner = TTY::Spinner.new("[:spinner] Training Pokeymon")
                        spinner.auto_spin
                        sleep(5)
                        spinner.success('(successful)')            
                        spinner.stop # Stop animation
    
                        puts trainer.training_pokeymon
                    when 'Play Pokeymon'
        
                        # tty spinner gem
                        spinner = TTY::Spinner.new("[:spinner] Playing with Pokeymon ...", format: :bouncing)
                        spinner.auto_spin 
                        sleep(5) 
                        spinner.stop('Done!') # Stop animation
        
                        puts trainer.playing_pokeymon
                    when 'Feed Pokeymon'
                        
                        spinner = TTY::Spinner.new("[:spinner] Feeding the Pokeymon ...", format: :spin_3)
                        spinner.auto_spin 
                        sleep(5) 
                        spinner.stop('Done!') # Stop animation
                        
                        puts trainer.feeding_pokeymon
                    when 'List of Pokeymon'
                        
                        spinner = TTY::Spinner.new("[:spinner] Counting the Pokeymon ...", format: :arrow_pulse)
                        spinner.auto_spin 
                        sleep(5) 
                        spinner.stop('Done!') # Stop animation
                        
                        puts trainer.catched_pokeymon
                    when 'Exit game'
                        puts "Thanks for Playing"
                        not_quiting = true
                end
end