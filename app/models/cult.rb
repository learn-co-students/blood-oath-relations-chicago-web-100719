class Cult
    attr_reader :name, :location, :slogan, :founding_year
    attr_accessor :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = 0
        self.class.all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        # create new blood oath with this cult instance 
        if follower.age >= self.minimum_age
            BloodOath.new(self, follower, Date.today)
        else puts "sorry maybe next year"
        end
    end

    def cult_population
        # iterate through blood oaths to find only the blood oaths for this cult
        # blood_oaths = Blood_Oath.all.select {|b| b.cult == self}
        # blood_oaths.count 
        followers.count
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

    def followers
        # iterating through blood oaths to create an array of each cult's followers
        blood_oaths = BloodOath.all.select {|b| b.cult == self}
        blood_oaths.collect {|b| b.follower}
    end

    def average_age
        # creating an array of just the ages of followers
        age_array = followers.collect {|f| f.age.to_f}
        # dividing the sum of ages by the population to get the average
        age_array.sum / self.cult_population
    end

    def my_followers_mottos
        # iterate through the instance's follower array to print out each motto
        self.followers.each {|f| puts f.life_motto}
    end

    def self.least_popular
        self.all.min {|c, d| c.cult_population <=> d.cult_population}
    end

    def self.most_common_location
        # iterating through cult instances to create an array of just locations
        location_array = self.all.collect {|c| c.location}
        # creating hash with location as keys and their frequency as values
        freq = location_array.inject(Hash.new(0)) { |ar, el| ar[el] += 1; ar }
        # iterating location to see which in the hash corresponds to the highest value
        location_array.max_by { |el| freq[el] }
    end

end