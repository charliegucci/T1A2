# gem for spinning animation
def show_spinner()
    spinner = TTY::Spinner.new("[:spinner] ...Adding")
        spinner.auto_spin
            sleep(1)
                spinner.success('(successful)')
end

def show_spinner2()
    spinner = TTY::Spinner.new("[:spinner] Checking the stocks. Please Wait ...", format: :bouncing_ball)
        spinner.auto_spin 
        sleep(1) 
        spinner.stop('Done!')

end

def pause()
    prompt = TTY::Prompt.new
    prompt.keypress(" Press space or enter to continue ", keys: [:space, :return])
                    system("clear")

end

# def show_error()
#     notes.list_reminder = YAML.load(File.read("@list_reminder.yml"))
#     box = TTY::Box.error("You don't have any saved Data")
# end