require 'pry'
class Cult

    attr_accessor :name, :year, :location, :slogan

    @@all = []

    def initialize(name, location, year, slogan)
        @name = name
        @location = location
        @year = year
        @slogan = slogan 
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(follower, self)
          else
            puts "Sorry, #{follower.name} is not yet old enough to join this cult."
          end
    end

    def cult_population
        BloodOath.all.select {|bloodoath| bloodoath.cult == self}.count
    end
     
    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.find{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.find{|cult| cult.year == year}
    end

    def followers
        blood_oaths = BloodOath.all.select {|bloodoath| bloodoath.cult == self}
        blood_oaths.collect{|b| b.follower}
    end

    def average_age
        ages = followers.collect {|f| f.age.to_f}
        ages.sum/ages.count
    end

    def my_followers_mottos
        self.followers.each {|follower| puts follower.life_motto}
    end

end