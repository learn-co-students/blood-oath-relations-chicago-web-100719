require 'time'

class BloodOath
    attr_reader :initiation_date, :follower, :age
    @@all = []

    def initialize(follower,cult)

        if cult.minimum_age && follower.age < cult.minimum_age
            puts "Sorry! You're too young to join this cult"
        else
            @follower = follower
            @cult = cult
            @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
            @@all << self
        end
    end

    def self.all
        @@all
    end

    def self.first_oath
        sort = self.all.sort_by do |oath|
            Time.parse(oath.initiation_date)
        end
        sort[0].follower
    end

end
