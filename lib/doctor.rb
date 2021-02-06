class Doctor 
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

    def appointments 
        Appointment.all.select { |appt| appt.doctor == self}
    end 

    def new_appointment(date, patient)
        new_appt = Appointment.new(date, patient, self)
        new_appt
    end 

    def patients 
        appointments.collect do |appt|
            appt.patient
        end 
    end 
end 


