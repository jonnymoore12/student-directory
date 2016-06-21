def input_students
   puts "Please enter the names and countries of birth of the students"
   puts "Please enter in the format: name,country"
   puts "To finish, just hit return twice"
   students = []
   name_and_country = gets.chomp
   while !name_and_country.empty? do
      while !name_and_country.include?(",")
         puts "Please use the format name,country (with a \",\")"
         name_and_country = gets.chomp
      end
      name = name_and_country.split(",")[0]
      country = name_and_country.split(",")[1]
      country = country[1..-1] if country[0] == " "
      students << {name: name, country: country, cohort: :November}
      puts "We now have #{students.count} students"
      name_and_country = gets.chomp
   end
   students
end

def print_header
   puts "The students of Villains Academy".center(50)
   puts "--------------"
end

def print(students)
   students.each_with_index do |student, index|
      # Or you can use student["name"] if your hash was set up like so:
      # "name" => "Darth Vader", etc. (Two ways of doing it)
      puts "#{index + 1}. #{student[:name]}, #{student[:country]} (#{student[:cohort]} cohort)".center(50)
   end
end

def print_footer(names)
   puts "Overall, we have #{names.count} nasty students.".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
