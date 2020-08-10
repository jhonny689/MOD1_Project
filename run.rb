require 'pry'
require_relative 'app/models/doctor'
require_relative 'app/models/patient'
require_relative 'app/models/appointment'
require './console.rb'

$Menu = [
    {input: 0, function: "Display Menu"},
    {input: 1, function: "Create Patient"},
    {input: 2, function: "Create Doctor"},
    {input: 9, function: "Free commands in PRY"},
    {input: "exit", function: "Exit"}
]

def run
    Console.setup
    #binding.pry
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
    when "3"
        puts list_doctors
        true
    when "4"
        puts list_patients
        true
    when "9"
        binding.pry
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
    doc = Doctor.new(d_name, d_speciality, d_years.to_i)
    
    puts "Doctor #{doc}, was successfully created."
    return "What else would you like to do?"
end

def list_doctors
    Doctor.all.each do |doc|
        puts "name = #{doc.name} || speciality = #{doc.speciality} || years = #{doc.years}."
    end
end

def list_patients
    Patient.all.each do |pat|
        puts "name = #{pat.name} || age = #{pat.age} || doctor = #{pat.doctor}."
    end
end

doc1 = Doctor.new("doc1","spec1",2)
doc2 = Doctor.new("doc2","spec2")

pat1 = Patient.new("pat1",22)
run
#binding.pry