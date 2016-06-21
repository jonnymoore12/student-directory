def input_students
   puts "Please enter the names and cohorts of the students"
   puts "Please enter in the format: name, cohort"
   puts "To finish, just hit return twice"
   students = []
   name_and_cohort = gets.chomp
   while !name_and_cohort.empty? do
      while !name_and_cohort.include?(",")
         puts "Please use the format: name,cohort (with a \",\")"
         name_and_cohort = gets.chomp
      end
      name = name_and_cohort.split(",")[0]
      cohort = name_and_cohort.split(",")[1]
      cohort = cohort[1..-1] if cohort[0] == " "
      students << {name: name, cohort: cohort}
      puts "We now have #{students.count} students"
      name_and_cohort = gets.chomp
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
   puts "Overall, we have #{names.count} nasty students."
end

students = input_students
print_header
print(students)
print_footer(students)
