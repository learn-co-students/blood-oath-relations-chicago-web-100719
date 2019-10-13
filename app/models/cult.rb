class Cult
    attr_accessor :minimum_age
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []


    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def blood_oaths
      BloodOath.all.collect{|b| b.cult == self}
    end

    def followers
      self.blood_oaths.map {|b| b.follower}

    def recruit_follower(new_follower)
        BloodOath.new(new_follower, self)
    end

    def cult_population
        followers.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|c| c.name == name}
    end

    def self.find_by_location(location)
        self.all.find {|c| c.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.find {|c| c.founding_year == year}
    end

    def average_age
        self.followers.sum {|f| f.age} / self.followers.length
    end

    def my_followers_mottos
        self.followers.map {|f| f.life_motto}
    end

    def self.least_popular
        self.all.min {|a,b| a.followers.length <=> b.followers.length}
    end

    def self.cult_locations
        locations = {}
        self.all.each do |cult|
            if !locations.include?(cult.location)
                locations[cult.location] = 1
            else
                locations[cult.location] += 1
            end
        end

        locations
    end

    def self.most_common_location
        location = self.cult_locations.max_by {|location, count| count}[0]
    end


end
