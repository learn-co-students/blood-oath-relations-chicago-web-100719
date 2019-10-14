class BloodOath
  attr_reader :cult, :follower, :date
  @@all = []

  def initialize(cult, follower, date)
    @cult = cult
    @follower = follower
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    sorted_oaths = self.all.sort_by { |bloodoath| bloodoath.date }
    return sorted_oaths[0].follower
  end

end