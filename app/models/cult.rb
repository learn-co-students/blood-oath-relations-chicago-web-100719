class Cult
attr_reader :name, :location, :founding_year
attr_accessor :slogan, :minimum_age
@@all = []

    def initialize(name, location, founding_year)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = ""
        @minimum_age = 0
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        if follower.age >= @minimum_age
            BloodOath.new(follower, self, Date.today)
        else
            puts "Sorry, this follower is too young. Please try again when they are at least #{@minimum_age}"
        end
    end

    def blood_oaths
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def followers
        self.blood_oaths.collect {|oath| oath.follower}

    end

    def cult_population
        self.followers.length
    end

    def self.find_by_name(name)
        Cult.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        Cult.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        Cult.all.select {|cult| cult.founding_year == year}
    end

    def average_age
        ages = self.followers.collect {|cultist| cultist.age}
        ages.sum / ages.length
    end

    def my_followers_mottos
        puts self.followers.collect {|cultist| cultist.life_motto}
    end

    def self.least_popular
        Cult.all.min {|a, b| a.cult_population <=> b.cult_population}
    end

    def self.most_common_location
        locations = {}
        Cult.all.collect {|cult| 
        if locations.keys.include?(cult.location) 
            locations[cult.location] += 1
        else 
            locations[cult.location] = 1
        end}
        locations.key(locations.values.max)
    end

#BONUS!

    
end