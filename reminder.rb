class Reminder
    

    def initialize
        @reminder = File.read("reminder.txt")
        @new_reminder = @reminder.split("%#&")
    end

    def opening_reminder
        @new_reminder.each do |element|
            box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3, title: {top_left: "NOTES",
                 bottom_right: 'wilson® v1.0'}, style: {fg: :bright_yellow, # TTY-BOX for the Reminder section
                bg: :blue, border: {fg: :bright_yellow, bg: :blue}}) do
                "#{element}"
              end   
              print box 
    
            end
        end

    def writing_reminder
        prompt = TTY::Prompt.new
        box = TTY::Box.info("Reminder Section")
                        print box
                        new_reminder = prompt.ask("Please type your notes here...", required: true)
                        File.open("reminder.txt", "a") { |file| file.write(new_reminder + "%#&") } 

    end

end

