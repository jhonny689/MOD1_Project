class Doctor
    attr_reader :speciality
    attr_accessor :name, :years

    def initialize (name, speciality, years=1)
        @name = name
        @speciality = speciality
        @years = years
    end
end