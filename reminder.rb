class Reminder
        
    def opening_reminder
        @reminder = File.read("reminder.txt")
        @new_reminder = @reminder.split("%#&")
        @new_reminder.each do |element|
            box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3, title: {top_left: "NOTES",
            bottom_right: 'wilson® v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: {fg: :bright_yellow, bg: :blue}}) do
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

    def deleting_reminder
        self.opening_reminder
        puts " Which note you want to delete? (eg. 1...10)"
                        user_delete_input = gets.chomp.to_i
                        @new_reminder.slice!(user_delete_input - 1)
                        File.open("reminder.txt", "w") { |file| file.write(@new_reminder.join("%#&")) }
                        box = TTY::Box.warn("Deleted Selected Notes")
                        print box

    end
end

