def input_students
   puts "Please enter the names and cohorts of the students"
   puts "Please enter in the format: name, cohort"
   puts "Leave the cohort field blank if you do not know it"
   puts "To finish, just hit return twice"
   students = []
   name_and_cohort = gets.chomp
   while !name_and_cohort.empty? do
      while !name_and_cohort.include?(",")
         puts "Please use the format: name,cohort (with a \",\")"
         name_and_cohort = gets.chomp
      end
      name = name_and_cohort.split(",")[0]
      if (name_and_cohort == name && !name_and_cohort.empty? ||
         name_and_cohort == name + "," && !name_and_cohort.empty?)
         cohort = "unspecified"
      else
         cohort = name_and_cohort.split(",")[1].capitalize
         # Why do I need this capitalize here??
         cohort = cohort[1..-1].capitalize if cohort[0] == " "
      end
      students << {name: name, cohort: cohort}
      if students.count == 1
         puts "We now have 1 student"
      else
         puts "We now have #{students.count} students"
      end
      name_and_cohort = gets.chop
   end
   students
end

def cohorts(students)
   cohort_months = students.map {|x| x[:cohort]}.uniq
end

def print_header
   linewidth = 100
   puts "The students of Villains Academy".center(50)
   puts "--------------".center(50)
end

def print(students, cohort_months)
   linewidth = 100
   cohort_months.each do |month|
      students.each_with_index do |student, index|
         # Or you can use student["name"] if your hash was set up like so:
         # "name" => "Darth Vader", etc. (Two ways of doing it)
         if student[:cohort] == month
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
         end
      end
   end
end

def print_footer(names)
   linewidth = 100
   puts "--------------".center(50)
   if names.count == 1
      puts "Our grand total is 1 villainous student!".center(50)
   else
      puts "Overall, we have #{names.count} villainous students.".center(50)
   end
end

students = input_students
if students.empty?
   puts "Nothing to print yo!"
   exit
end
print_header
cohort_months = cohorts(students)
print(students, cohort_months)
print_footer(students)
