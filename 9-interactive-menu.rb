@students = []

def interactive_menu
   loop do
      print_menu
      process(gets.chomp)
   end
end

def print_menu
   puts "1. Input the students"
   puts "2. Show the students"
   puts "9. Exit"
end

def process(selection)
   case selection
   when "1"
      input_students
   when "2"
      show_students
   when "9"
      exit
   else
      puts "I didn't catch that. Can you try again please?"
   end
end

def show_students
   print_header
   cohort_months = cohorts
   print_students_list(cohort_months)
   print_footer
end



def input_students
   puts "Please enter the names, cohorts and favourite hobbies of the students"
   puts "Please enter in the format: name, cohort, favourite hobby"
   puts "Leave the cohort or hobby field blank if you wish"
   puts "To finish, just hit return twice"
   @students = []
   name_cohort_hobby = gets.chomp
   while !name_cohort_hobby.empty? do
      while name_cohort_hobby.count(",") != 2
         puts "Please use the format: name,cohort,hobby (with two \",\"s)"
         name_cohort_hobby = gets.chomp
      end
      name = name_cohort_hobby.split(",")[0]
      cohort = name_cohort_hobby.split(",")[1].capitalize || "Unspecified"
      # Get rid of the potential " " after diving commas
      cohort = cohort[1..-1].capitalize if cohort[0] == " "
      hobby = name_cohort_hobby.split(",")[2].capitalize || "Unspecified"
      # Get rid of the potential " " after diving commas
      hobby = hobby[1..-1].capitalize if hobby[0] == " "
      @students << {name: name, cohort: cohort, hobby: hobby}
      if @students.count == 1
         puts "We now have 1 student"
      else
         puts "We now have #{@students.count} students"
      end
      name_cohort_hobby = gets.chomp
   end
end

def cohorts
   cohort_months = @students.map {|x| x[:cohort]}.uniq
end


def print_header
   linewidth = 100
   puts "The students of Villains Academy".center(50)
   puts "--------------".center(50)
end

def print_students_list(cohort_months)
   linewidth = 100
   cohort_months.each do |month|
      @students.each_with_index do |student, index|
         # Or you can use student["name"] if your hash was set up like so:
         # "name" => "Darth Vader", etc. (Two ways of doing it)
         if student[:cohort] == month
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
            puts "Hobby: #{student[:hobby]}".center(50)
         end
      end
   end
end

def print_footer
   linewidth = 100
   puts "--------------".center(50)
   if @students.count == 1
      puts "Our grand total is 1 villainous student!".center(50)
   else
      puts "Overall, we have #{@students.count} villainous students.".center(50)
   end
end

interactive_menu

# We don't need these old method calls for now
=begin
students = input_students
if students.empty?
   puts "Nothing to print yo!"
   exit
end
print_header
cohort_months = cohorts(students)
print(students, cohort_months)
print_footer(students)
=end
