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
   count = 0
   until count == students.length
      puts "#{students[count][:name]} (#{students[count][:cohort]} cohort}"
      count += 1
   end
end

def print_footer(names)
   puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
