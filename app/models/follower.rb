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
        blood_oaths = BloodOath.all.select {|b| b.follower == self}
        blood_oaths.collect {|b| b.cult}
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(cult, self, Date.today)
        else puts "sorry maybe next year"
        end
    end

    def self.of_a_certain_age(age)
        self.all.select {|f| f.age >= age}
    end

    def my_cults_slogans
        self.cults.each { |c| puts c.slogan }
    end

    def self.most_active
        # calling first element of sorted array using my method
        self.most_to_least_cults[0]
        # self.all.max { |f, g| f.cults.count <=> g.cults.count }
    end

    def self.most_to_least_cults
        # iterate followers to sort them by most cults
        self.all.sort { |f, g| f.cults.count <=> g.cults.count }.reverse
    end

    def self.top_ten
        self.most_to_least_cults[0..9]
    end

    def fellow_cult_members
        # pull blood oaths of cults that they're in
        blood_oaths = BloodOath.all.select { |b| self.cults.include?(b.cult) }
        # collect the unique followers out of the blood oath array
        followers_including_you = blood_oaths.collect { |b| b.follower }.uniq 
        # remove yourself from the array
        followers_including_you.delete(self)
        # return array without you
        followers_including_you
    end
end