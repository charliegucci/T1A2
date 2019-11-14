class Breeder 
    
    attr_reader :collection

    def initialize
        @collection = []
    end
    
    def update_database(bird)
        @collection.push(bird)
       p @collection 
    end
    
    def list_stocks
        
        @collection.each do |x|
            puts "Added #{x.type} #{x.mutation} Tag is #{x.type} #{x.sex} Bird" 
        end
     
    end

end