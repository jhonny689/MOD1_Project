require 'pry'
require_relative 'app/models/doctor'
require_relative 'app/models/patient'

doc1 = Doctor.new("doc1","spec1",2)
doc2 = Doctor.new("doc2","spec2")

pat1 = Patient.new("pat1",22)

binding.pry