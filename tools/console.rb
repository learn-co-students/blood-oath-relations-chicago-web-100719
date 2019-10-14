require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

daleks = Cult.new("Cult of Skaro", "Leeds", 1967)
supernatural = Cult.new("Winchesters", "Omaha", 2004)
whovian = Cult.new("Whovians", "Cardiff", 1963)
good_place = Cult.new("Janetites", "Jacksonville", 2017)
death_eaters = Cult.new("Death Eaters", "London", 1980)
garbage = Cult.new("Garbage People", "Jacksonville", 2005)
sherlock = Cult.new("The Sherlocked", "London", 2008)
oscar = Cult.new("The Wilde Bunch", "London", 1887)
drowned_god = Cult.new("Ironborn", "Pyke", 1996)
rhllor = Cult.new("The Flaming Heart", "Dragonstone", 1997)



daleks.slogan = "EXTERMINATE!!"
supernatural.slogan = "Carry On, Wayward Son"
whovian.slogan = "I am the Oncoming Storm"
death_eaters.slogan = "Purebloods Only" 
good_place.slogan = "Not a person"
drowned_god.slogan = "What is dead may never die"
rhllor.slogan = "The night is dark and full of terrors"


derek = Follower.new("Derek", 24)
dean = Follower.new("Dean Winchester", 32)
john = Follower.new("John Smith", 79)
tina = Follower.new("Tina Belcher", 13)
katniss = Follower.new("Katniss Everdeen", 19)
mel = Follower.new("Melisandre Asshai", 147)
damphair = Follower.new("Aeron Greyjoy", 56)
sam = Follower.new("Sam Winchester", 27)
cas = Follower.new("Castiel", 42)
donna = Follower.new("Donna Noble", 38)
tom = Follower.new("Tom Riddle", 86)
amy = Follower.new("Amelia Pond", 29)


 
derek.life_motto = "Derek!"
dean.life_motto = "Let's kill some demons"
john.life_motto = "Who do you think I am?"
tina.life_motto = "Butts, butts, butts"
katniss.life_motto = "Burn it down"

daleks.recruit_follower(derek)
supernatural.recruit_follower(katniss)
whovian.recruit_follower(tina)
whovian.recruit_follower(derek)
supernatural.recruit_follower(tina)
death_eaters.recruit_follower(derek)
rhllor.recruit_follower(mel)
drowned_god.recruit_follower(damphair)


donna.join_cult(whovian)
tom.join_cult(death_eaters)
tom.join_cult(daleks)
donna.join_cult(good_place)
sam.join_cult(supernatural)
damphair.join_cult(garbage)
derek.join_cult(garbage)
tina.join_cult(rhllor)
katniss.join_cult(rhllor)
dean.join_cult(supernatural)
amy.join_cult(whovian)
dean.join_cult(daleks)



test_oath = tina.join_cult(good_place)
kat_oath = katniss.join_cult(death_eaters)
old_oath = john.join_cult(whovian)
todays_oath = john.join_cult(daleks)

old_oath.initiation = Date.new(1963,11,22)
kat_oath.initiation = Date.new(2010,07,12)

death_eaters.minimum_age = 18

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
