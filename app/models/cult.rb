class Cult
    attr_reader :name, :location, :slogan, :founding_year

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        self.class.all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        # create new blood oath with this cult instance 
        Blood_Oath.new(self, follower, Date.today)
    end

    def cult_population
        # iterate through blood oaths to find only the blood oaths for this cult
        blood_oaths = Blood_Oath.all.select {|b| b.cult == self}
        blood_oaths.count 
    end

    def self.find_by_name(name)
        # searching array of all the cults and returning first with the same name attribute
        self.all.find {|c| c.name == name}
    end

    def self.find_by_location(location)
        # searching array of cults and returning all cults matching given location
        self.all.select {|c| c.location == location}
    end

    def self.find_by_founding_year(year)
        #searching array of cults and returning all with matching founding_years
        self.all.select {|c| c.founding_year == year}
    end
end