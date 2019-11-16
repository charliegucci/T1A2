def show_spinner()
    spinner = TTY::Spinner.new("[:spinner] ...Adding")
        spinner.auto_spin
            sleep(1)
                spinner.success('(successful)')
end