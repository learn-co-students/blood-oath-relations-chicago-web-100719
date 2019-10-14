class BloodOath
attr_reader :follower, :cult
attr_accessor :initiation
@@all = []

    def initialize(follower, cult, initiation)
        @follower = follower
        @cult = cult
        @initiation = initiation
        @@all << self
    end

    def initiation_date
        @initiation.to_s
    end

    def self.all
        @@all
    end

    def self.first_oath
        BloodOath.all.min {|a, b| a.initiation <=> b.initiation}
    end

end