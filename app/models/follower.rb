class Follower
  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def bloodoaths
    BloodOath.all.select { |bloodoath| bloodoath.follower == self }
  end

  def cults
    self.bloodoaths.map { |bloodoath| bloodoath.cult }
  end

  def join_cult(cult, date)
    BloodOath.new(cult, self, date)
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age == age }
  end

  def my_cults_slogans
    self.cults.map { |cult| cult.slogan }
  end

  def self.most_active
    sorted_followers = self.all.sort_by { |follower| follower.cults.size }
    return sorted_followers[-1]
  end

  def self.top_ten
    sorted_followers = self.all.sort { |x, y| y.cults.size <=> x.cults.size }
    return sorted_followers[0..9]
  end

end