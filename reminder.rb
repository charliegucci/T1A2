class Reminder
    attr_accessor :list_reminder   
   
   def initialize()
       @list_reminder =[]
   end
   def opening_reminder()
        @list_reminder = YAML.load(File.read("@list_reminder.yml"))
       @list_reminder.each do |element|
       box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3, title: {top_left: "NOTES",
           bottom_right: 'wilson® v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: {fg: :bright_yellow,
           bg: :blue}}) do "#{element}"
           end   
           print box 
       end
   end
   
   def writing_reminder()
       prompt = TTY::Prompt.new
       box = TTY::Box.info("Reminder Section")
       print box
       @new_reminder = prompt.ask("Please type your notes here...", required: true)
       @list_reminder.push(@new_reminder)
       File.open("@list_reminder.yml", "w") { |file| file.write(@list_reminder.to_yaml) }
       box = TTY::Box.success("Notes Added")
       print box
       pause
   end

   def deleting_reminder()
       prompt = TTY::Prompt.new
       self.opening_reminder
       puts " Which note you want to delete? (eg. 1,2,3..starting from the top)"
           reminder_delete_input = gets.chomp.to_i
           @list_reminder.slice!(reminder_delete_input - 1)
           box = TTY::Box.warn("Are you sure you want to delete?")
                    print box
                    user_input = prompt.ask("Press Y / N then hit Enter", required: true) 
                        if user_input == "y"
                        File.open("@list_reminder.yml", "w") { |file| file.write(@list_reminder.to_yaml) }
                        box = TTY::Box.success("Notes Deleted")
                            print box
                            pause
                        else
                            opening_reminder
                        end
    
    
    
    
    
           #    #         if reminder_delete_input.kind_of? Integer && @list_reminder[reminder_delete_input - 1].nil?
    #                        box = TTY::Box.warn("Are you sure you want to delete?")
    #                        print box
    #                        reminder_user_input = prompt.ask("Press Y / N then hit Enter", required: true)
    #                            if reminder_user_input
    #                                box = TTY::Box.success("Notes Deleted")
    #                                print box
    #                                pause
    #                            end       
                   # else
                   #     box = TTY::Box.error("Invalid Choice1")
                   #     print box
                   #     pause

                   
                   
                   
                   
                   
               #     puts reminder_delete_input
               #     p @list_reminder[reminder_delete_input - 1].nil?
               #                 p reminder_delete_input.class
               
               # elsif @list_reminder[reminder_delete_input - 1].nil && reminder_delete_input.is_a? Integer
               #                 box = TTY::Box.error("Invalid Choice2")
               #                 p @list_reminder[reminder_delete_input - 1].nil?
               #                 p reminder_delete_input.class
               #                 print box
               #                 pause
               
               # if  reminder_delete_input.is_a? Integer && @list_reminder[reminder_delete_input - 1] == nil
               #     box = TTY::Box.error("Invalid Choice3")
               #     p @list_reminder[reminder_delete_input - 1].nil?
               #                 p reminder_delete_input.class
               #     print box
               #     pause
                           
               # else            
                           
               # end
               # end
               # end
                
           
                
   end
end
