class Appointment
    @@all = []
    attr_accessor :date
    attr_reader :doctor, :patient
    def initialize(doctor, patient, date)
        self.doctor = doctor
        self.patient = patient
        self.date = date

        @@all << self
    end

    def self.all
        @@all
    end

    def self.exist?(doctor, patient, date)
        @@all.any? do |appointment|
            appointment.doctor == doctor && appointment.patient == patient && appointment.date == date
        end
    end

    private
    def doctor= (doctor)
        @doctor = doctor
    end

    def patient= (patient)
        @patient = patient
    end
end