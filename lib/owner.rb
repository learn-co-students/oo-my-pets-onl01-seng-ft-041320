require "pry"
class Owner
  # code goes here
  
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
    binding.pry
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner.name == self.name}

  end
  
  def dogs
    # binding.pry
    Dog.all.select{|dog| dog.owner.name == self.name}
  end

    
end
