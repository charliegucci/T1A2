require "tty-table"

class Breeder
    
    
    attr_accessor :collection

    def initialize
        @collection = []
        
    end
    
    def update_database(bird)
        @collection.push(bird)
        File.open("@collection.yml", "w") { |file| file.write(@collection.to_yaml) }
    end    
    
        def list_stocks
        @collection = YAML.load(File.read("@collection.yml"))
        @collection.each do |element|
            puts "Added #{element.type} #{element.mutation} Tag is #{element.id_tag} #{element.sex} Bird" 
            table = TTY::Table.new ['ID TAG','TYPE', 'MUTATION', 'SEX', 'AGE(Months)'], [[element.id_tag, element.type, element.mutation, element.sex, element.age]]
            
            puts table.render(:unicode, alignments: [:center, :center, :center, :center, :center])
        
    
            end

        
    end
    
    
end
