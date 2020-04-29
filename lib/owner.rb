class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @species = species
    @name = name
    @@all << self
  end
  def say_species
    "I am a #{@species}."
  end
  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.find_all{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.find_all{|dog| dog.owner == self}
  end 

  def buy_cat(cats_name)
   cats_name = Cat.new(cats_name, self)
  end 

  def buy_dog(dogs_name)
    dogs_name = Dog.new(dogs_name, self)
  end 

  def walk_dogs
   self.dogs.each{|dog| dog.mood = "happy"}
  end 
  
  def feed_cats 
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each do |cat| 
      cat.mood = "nervous"
       cat.owner = nil
    end
    self.dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end
  end 
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end