class Patient 
    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name
        save 
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def new_appointment(date, doctor)
        new_appt = Appointment.new(date, self, doctor)
        new_appt
    end 

    def appointments
        Appointment.all.select do |appt|
            appt.patient == self
        end 
    end 

    def doctors 
        appointments.collect do |appt| 
            appt.doctor
        end
    end 
end 