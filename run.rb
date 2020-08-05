require 'pry'
require_relative 'app/models/doctor'
require_relative 'app/models/patient'

$Menu = [
    {input: 0, function: "Display Menu"},
    {input: 1, function: "Create Patient"},
    {input: 2, function: "Create Doctor"},
    {input: "exit", function: "Exit"}
]

def run
    puts "Hello, welcome to our CLI..."
    puts "For a menu of our functionalities [help] press 0 at any time, or exit to leave"
    keep_going = true
    while keep_going do
        keep_going = listener
    end
end

def listener
    input = gets.chomp
    case input
    when "0"
        display_menu
        true
    when "1"
        puts create_patient
        true
    when "2"
        puts create_doctor
        true
    when "exit"
        false
    end
end

def display_menu
    $Menu.each do |option|
        puts "Press #{option[:input]} to #{option[:function]}."
    end
end

def create_patient
    # get the patient info
    puts "what is your patient name?"
    p_name = gets.chomp
    puts "how old is your patient?"
    p_age = gets.chomp

    # create the patient and let the user know it was successfull
    p = Patient.new(p_name, p_age.to_i)
    
    puts "Patient #{p}, was successfully created."
    return "What else would you like to do?"
end

def create_doctor
    # get the doctor info
    puts "what is your doctor name?"
    d_name = gets.chomp
    puts "what speciality does he practice?"
    d_speciality = gets.chomp
    puts "for how long?"
    d_years = gets.chomp

    # Create the doctor and let the user know it was successfull
    doc = Patient.new(d_name, d_speciality, d_years.to_i)
    
    puts "Patient #{doc}, was successfully created."
    return "What else would you like to do?"
end

doc1 = Doctor.new("doc1","spec1",2)
doc2 = Doctor.new("doc2","spec2")

pat1 = Patient.new("pat1",22)
run
#binding.pry