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
            p = Pastel.new
            @collection = YAML.load(File.read("@collection.yml"))
            @collection.each do |element|
                puts "Added #{element.type} #{element.mutation} Tag is #{element.id_tag} #{element.sex} Bird" 
            id_tag = p.decorate("ID TAG",:black, :on_green)
            type = p.decorate("TYPE",:black, :on_green)
            mutation = p.decorate("MUTATION",:black, :on_green)
            sex = p.decorate("SEX",:black, :on_green)
            age = p.decorate("AGE (mos)",:black, :on_green)
            table = TTY::Table.new ["#{id_tag}","#{type}","#{mutation}","#{sex}","#{age}"], [[element.id_tag, element.type, element.mutation, element.sex, element.age]]
                puts table.render(:unicode, alignments: [:center, :center, :center, :center, :center])
            end

        end
end
