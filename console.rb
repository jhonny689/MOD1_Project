require 'pry'
require_relative './app/models/patient'
require_relative './app/models/doctor'

class Console
    def self.setup
            
        doctors = [
            {name: "D. Smith", speciality: "Surgeon", years: 10},
            {name: "D. Johnson", speciality: "Cardiologist", years: 7},
            {name: "D. Williams", speciality: "Surgeon", years: 5},
            {name: "D. Jones", speciality: "Dermatologist", years: 5},
            {name: "D. Brown", speciality: "Cardiologist", years: 8},
            {name: "D. Davis", speciality: "Oncologist", years: 6},
            {name: "D. Miller", speciality: "Radiologist", years: 4},
            {name: "D. Wilson", speciality: "Family Medicine", years: 4},
            {name: "D. Garcia", speciality: "Family Medicine", years: 5},
            {name: "D. Rodriguez", speciality: "Neurologist", years: 12}
        ]

        patients = [
            {name: "Liam", age: 15 },
            {name: "John", age: 18 },
            {name: "Jane", age: 19 },
            {name: "Emma", age: 20 },
            {name: "Olivia", age: 21 },
            {name: "Ava", age: 14 },
            {name: "William", age: 15 },
            {name: "Noah", age: 25 }
        ]

        doctors.each do |doctor|
            Doctor.new(doctor[:name], doctor[:speciality], doctor[:years])
        end

        patients.each do |patient|
            Patient.new(patient[:name], patient[:age])
        end
    end
end