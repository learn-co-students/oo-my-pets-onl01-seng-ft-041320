class Owner
  attr_accessor :dogs, :cats, :pets
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @pets = []
    @dogs = []
    @cats = []
    @name = name
    @species = "human"
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def sell_pets
    sell_cats
    sell_dogs
  end

  def sell_cats
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def sell_dogs
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end
