class Doctor
    attr_reader :speciality
    attr_accessor :name, :years
    @@all = []

    def initialize (name, speciality, years=1)
        @name = name
        @speciality = speciality
        @years = years
        @@all << self
    end

    def greet(patient)
        puts "Welcome, #{patient.name}. How are you feeling today?"
    end

    # all methods under this line and above private are Class methods
    def self.all
        @@all
    end
    def self.find_by_specialty (speciality)
        self.all.filter do |doctor|
            doctor.speciality == speciality
        end
    end
end