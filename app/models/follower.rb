class Follower
attr_reader :name, :age
attr_accessor :life_motto
@@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @life_motto = ""
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        Cult.all.select {|cult| cult.followers.include?(self)}
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self, cult, Date.today)
        else
            puts "Sorry, you are too young for this cult. Please come back when you are #{cult.minimum_age}"
        end
    end

    def self.of_a_certain_age(age)
        self.all.select {|cultist| cultist.age >= age}
    end

    def my_cults_slogans
        self.cults.collect {|cult| cult.slogan}
    end


    def self.most_active
       Follower.all.max {|a, b| a.cults.length <=> b.cults.length}
    end

    def self.top_ten
        Follower.all.max(10) {|a, b| a.cults.length <=> b.cults.length}

    end


#BONUS!
    def fellow_cult_members
        fellows = cults.collect {|c| c.followers.reject {|f| f == self}}
        return fellows.flatten.uniq
    end

end