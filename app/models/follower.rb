class Follower

    attr_accessor :name, :age, :life_motto

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
    
    def cults
       bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.follower == self}
       bloodoaths.map {|bloodoaths| bloodoaths.cult}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogan
        cults.map {|cult| cult.slogan }
    end

    def self.follower_activity_sort
        follower_activity = self.all.map do |follower|
          {follower => follower.cults.length}
        end
        sorted_follower_activity = follower_activity.sort_by do |follower|
          follower.values[0]
        end
        sorted_follower_activity.reverse
     end

    def self.most_active
        self.follower_activity_sort[0]
    end

    def self.top_ten
        follower_activity_sort[0...9]
    end

end