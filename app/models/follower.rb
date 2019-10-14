class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        self.class.all << self
    end

    def self.all
        @@all
    end

    def cults
        blood_oaths = Blood_Oath.all.select {|b| b.follower == self}
        blood_oaths.collect {|b| b.cult}
    end

    def join_cult(cult)
        Blood_Oath.new(cult, self, Date.today)
    end

    def self.of_a_certain_age(age)
        self.all.select {|f| f.age >= age}
    end
end