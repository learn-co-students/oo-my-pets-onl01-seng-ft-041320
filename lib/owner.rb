class Owner
  # code goes here
  @@all = []
  @@count = 0 
  attr_reader :name, :species
  
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
    @@count += 1 
  end
  
  def say_species 
    return "I am a #{@species}."
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
  
  def cats 
    return Cat.all.filter{ |x| x.owner == self}
  end
  
  def dogs 
    return Dog.all.filter{ |x| x.owner == self} 
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs 
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end
  end
  
  def list_pets 
    num_of_cat = 0 
    num_of_dog = 0
    Cat.all.each do |cat|
      if self == cat.owner
        num_of_cat += 1 
      end
    end
    Dog.all.each do |dog|
      if self == dog.owner
        num_of_dog += 1 
      end
    end
    return "I have #{num_of_dog} dog(s), and #{num_of_cat} cat(s)."
  end
end