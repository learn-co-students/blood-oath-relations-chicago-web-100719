class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
      Bloodoath.all.collect{|b| b.follower == self}
    end

    def join_cult(cult)
        Bloodoath.new(self, cult)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select {|f| f.age >= age}
    end

    def my_cult_slogans
        self.cults.map {|c| c.slogan}
    end

    def self.most_active
        self.all.max {|a, b| a.cults.length <=> b.cults.length}
    end

    def self.top_ten
        self.all.max(10) {|a,b| a.cults.length <=> b.cults.length}
    end

    def fellow_cult_members
        fellow_members = Follower.all.select {|follower| (follower.cults & self.cults).empty? == false && follower.cults != [] && follower != self}
        fellow_members.map {|m| m.name}

    end
end
