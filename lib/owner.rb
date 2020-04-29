require 'pry'

class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize (name)
    @name = name 
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all 
    @@all 
  end
  
  def self.count 
    @@all.size 
  end
  
  def self.reset_all 
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (cats_name)
    Cat.new(cats_name, self)
  end

  def buy_dog (dogs_name)
    Dog.new(dogs_name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats 
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each {|pet| pet.mood = "nervous"
    pet.owner = nil}
    self.dogs.each {|pet| pet.mood = "nervous"
    pet.owner = nil}
  end
  
  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
  
end











