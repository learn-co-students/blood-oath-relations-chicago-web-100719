require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

zayd = Follower.new('Zayd', 33, 'live slow, die old')
amr = Follower.new('Amr', 23, 'live fast, die young')
bakr = Follower.new('Bakr', 77, 'seeking knowledge')
illuminati = Cult.new('Illuminati', 'NYC', 1750, 'gnosis')
shriners = Cult.new('Shriners', 'London', 1905, 'liberty and equality')
masons = Cult.new('Masons', 'NYC', 1850, 'equality and liberty')
zayd.join_cult(illuminati, 1999)
amr.join_cult(masons, 1990)
bakr.join_cult(shriners, 1977)
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
