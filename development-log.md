## Development Log
---
11/11/19  Issue after creating Bird Class<br>
* I was able to pass the parameters to the class instance variable in an array and iterate each element but was showing class object id and not the value of the element.<br>
<br>
```ruby
wilson.update_database(Bird.new) 
```
Fixed with:<br>
```ruby
lovebird = Bird.new(bird_id_tag, bird_type, bird_mutation,bird_sex, bird_age)
        
wilson.update_database(lovebird)
```
Iterate Element
```ruby
def update_database
    @collection.each do |element|
    puts element
end
```
Fixed with:
```ruby
def update_database
@collection.each do |element|
puts element.type
puts element.age
puts element.sex
end
```

15/11/19 Control Flow<br>
* Having issue when user inputs an invalid integer or string when deleting an item from an array.<br>
<br>
Fixed by
``` ruby
user_delete_input = gets.chomp.to_i
        if user_delete_input.between?(1, @collection.length)
            @collection.slice!(user_delete_input.to_i - 1)
        else
            puts "invalid choice"
        end
```


