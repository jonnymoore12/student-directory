puts "Please enter the names and countries of birth of the students"
puts "Please enter in the format name,country"
puts "To finish, just hit return twice"
students = []
name_and_country = gets.chomp
name = name_and_country.split(",")[0]
country = name_and_country.split(",")[1]

puts name
puts country
