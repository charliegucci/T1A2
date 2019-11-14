

class Breeder
    
    
    attr_reader :collection

    def initialize
        @collection = []
    end
    
    def update_database(bird)
        spinner = TTY::Spinner.new("[:spinner] Adding...")
        spinner.auto_spin
        @collection.push(bird)
        @collection.each do |element|
        sleep(2)
        spinner.stop('Done!')
        end
    end
    
    def list_stocks
        
        @collection.each do |element|
            puts "#{element.type} #{element.mutation} Tag is #{element.id_tag} #{element.sex} Bird" 
            
            
            
        end
        
    end
    
    
end
