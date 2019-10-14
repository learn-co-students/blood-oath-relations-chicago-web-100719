require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# making cults to test
j_for_j = Cult.new("Jews for Jesus", "Jerusalem", 1969, "Jews need a king")
koolaid = Cult.new("Kool-Aid Krew", "Atlanta", 2010, "we just like the way it tastes")
manson_family = Cult.new("The Manson Family", "Atlanta", 1965, "take acid and kill")
# making followers to test
brad = Follower.new("Brad", 27, "good vibes")
jane = Follower.new("Jane", 40, "I'm no Karen")
tex = Follower.new("Tex", 18, "I'd love some LSD")
tim = Follower.new("Time", 33, "o boy a cult")
alex = Follower.new("Alex", 31, "be sexy or be sexy at it")
nathan = Follower.new("Nathan", 26, "Atlanta sux")
mom = Follower.new("Laura", 60, "come home")
anna = Follower.new("Anna", 24, "are you mad at me?")
hope = Follower.new("Hope", 25, "I'm low maintenance")
ryan = Follower.new("Ryan", 27, "call me coach")
ethan = Follower.new("Ethan", 26, "I make so much money")
david = Follower.new("David", 22, "don't scoop me")
j_for_j.recruit_follower(brad)
jane.join_cult(j_for_j)
tex.join_cult(manson_family)
jane.join_cult(manson_family)
tim.join_cult(manson_family)
alex.join_cult(manson_family)
nathan.join_cult(j_for_j)
mom.join_cult(j_for_j)
anna.join_cult(koolaid)
hope.join_cult(j_for_j)
ryan.join_cult(j_for_j)
trish = Follower.new("Trish", 16, "go wildcats")
j_for_j.minimum_age = 17
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
