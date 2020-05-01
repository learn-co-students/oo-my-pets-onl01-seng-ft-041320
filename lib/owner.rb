# require 'pry'
class Owner
  attr_accessor :dog, :cat
  attr_reader :name, :species
  @@count = 0
  @@all = [ ]
  # attr_writer :species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
     @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
    #create a method that iterates through the information and 
    # binding.pry
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name,self) 
  end

  def buy_dog(dog_name)
    Dog.new(dog_name,self) 
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each do |dog| 
      dog.mood = "nervous" 
    dog.remove_instance_variable(:@owner)
  end
    cats.each do |cat| 
      cat.mood = "nervous" 
    cat.remove_instance_variable(:@owner)
  end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  #   Cat.all.each{|cat| cat = @owner}
  # #   if Cat.all = self.find {|cat| cat = @name}
  # # end
  # end
  # code goes here
end