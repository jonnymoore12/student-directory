def input_students
   puts "Please enter the names of the students"
   puts "To finish, just hit return twice"
   students = []
   name = gets.chomp
   while !name.empty? do
      students << {name: name, cohort: :november}
      puts "We now have #{students.count} students"
      name = gets.chomp
   end
   students
end

def print_header
   puts "The students of Villains Academy"
   puts "--------------"
end

def print(students)
   students.each_with_index do |student, index|
      # Or you can use student["name"] if your hash was set up like so:
      # "name" => "Darth Vader", etc. (Two ways of doing it)
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
   end
end

def print_footer(names)
   puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
