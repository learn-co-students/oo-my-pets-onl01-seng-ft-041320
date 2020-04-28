class Owner
  # code goes here
  attr_accessor :pets
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|cat| cat.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog_mood| dog_mood.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat_mood| cat_mood.mood = "happy"}
  end

  def sell_pets
    Dog.all.each {|mood_change| mood_change.mood = "nervous"}
    Cat.all.each {|mood_change| mood_change.mood = "nervous"}
    Dog.all.each {|unowned| unowned.owner = nil}
    Cat.all.each {|unowned| unowned.owner = nil}
  end

  def list_pets
    return "I have #{Dog.all.select {|dog| dog.owner == self}.length} dog(s), and #{Dog.all.select {|dog| dog.owner == self}.length} cat(s)."
  end
end