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

    def appointments
        Appointment.all.filter do |appointment|
            appointment.doctor == self
        end
    end

    def patients
        appointments.map do |appointment|
            appointment.patient
        end.uniq
    end

    # def patients
    #     Patient.all.filter do |patient|
    #         patient.doctor == self
    #     end
    # end

    # def discharge_patient(patient)
    #     if patient.doctor == self
    #         patient.change_doctors(nil)
    #         puts "#{patient.name}, was discharged."
    #     else
    #         puts "You cannot discharge #{patient.name}, they are not your patient!!"
    #     end
    # end

    # def transfer_patient(patient, new_doctor)
    #     if patient.doctor == self
    #         patient.change_doctors(new_doctor)
    #         puts "#{new_doctor.name} is now #{patient.name}'s doctor instead of #{self.name}."
    #     else
    #         puts "You cannot transfer #{patient.name}, they are not your patient!!"
    #     end
    # end
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