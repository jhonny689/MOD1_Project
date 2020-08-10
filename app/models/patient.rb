class Patient
    attr_accessor :name, :age, :impatience
    attr_reader :doctor
    @@all = []
    
    def initialize(name, age)
        @name = name
        @age = age
        @impatience = 0
        @@all << self
    end

    def inquire_appt_ready
        puts "The Doctor will be ready soon"
        increase_impatiance
    end

    def appointments
        Appointment.all.filter do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        self.appointments.map do |appointment|
            appointment.doctor
        end.uniq
    end

    def create_appointment(doctor, date)
        if !Appointment.exist?(doctor, self, date)
            Appointment.new(doctor, self, date)
        else
            "this exact appointment exists, you don't want to create it again"
        end
    end
    # def change_doctors(doc)
    #     this.doctor = doc
    # end

    # all methods under this line and above private are Class methods
    def self.all
        @@all
    end

    private # all methods under this are private and can only be called from whithin this class

    def increase_impatiance
        self.impatiance += 1
    end
end