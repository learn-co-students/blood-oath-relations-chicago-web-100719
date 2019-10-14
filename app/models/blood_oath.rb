class BloodOath
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

    def initiation_date_as_date
        @initiation_date
    end

    def self.first_oath
        # # find earliest year
        # low_year = self.all.min { |b, c| b.initiation_date_as_date.year <=> c.initiation_date_as_date.year }
        # # find all blood oaths within that year
        # low_year_oaths = self.all.select { |b| b.initiation_date_as_date.year == low_year }
        # # within those find earliest month
        # low_month = low_year_oaths.min { |b, c| b.initiation_date_as_date.month <=> c.initiation_date_as_date.month }
        # # find oaths in that month
        # low_month_oaths = low_year_oaths.select { |b| b.initiation_date_as_date.month == low_month }
        # # within those find earliest day
        # low_day = low_month_oaths.min { |b, c| b.initiation_date_as_date.day <=> c.initiation_date_as_date }
        # # return the oath with the low day
        # low_month_oaths.find { |b| b.initiation_date_as_date.day == low_day }
        self.all.first.follower
    end

end
