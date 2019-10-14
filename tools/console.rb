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

# making followers to test
brad = Follower.new("Brad", 27, "good vibes")
jane = Follower.new("Jane", 40, "I'm no Karen")
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
