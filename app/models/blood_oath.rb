class Blood_Oath
    attr_reader :cult, :follower
    
    @@all = []
    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        self.class.all << self
    end

    def self.all
        @@all
    end

    def initiation_date
        initiation_date.to_s
    end

end
