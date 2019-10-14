class Cult
attr_reader :name, :location, :founding_year, :slogan
@@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def bloodoaths
    BloodOath.all.select { |bloodoath| bloodoath.cult == self }
  end

  def followers
    self.bloodoaths.map { |bloodoath| bloodoath.follower }
  end

  def recruit_follower(follower, date)
    BloodOath.new(self, follower, date)
  end

  def cult_population
    self.followers.size
  end

  def self.find_by_name(name)
    self.all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(founding_year)
    self.all.select { |cult| cult.founding_year == founding_year }
  end

  def average_age
    ages = self.followers.map { |follower| follower.age }
    return ages.reduce(:+).to_f / ages.size
  end

  def my_followers_mottos
    self.followers.map { |follower| follower.life_motto }
  end

  def self.least_popular
    sorted_cults = self.all.sort_by { |cult| cult.cult_population }
    return sorted_cults[0]
  end

  def self.most_common_location
    cult_locations = self.all.map { |cult| cult.location }
    cult_locations.max
  end

end