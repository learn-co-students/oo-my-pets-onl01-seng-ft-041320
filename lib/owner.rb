class Owner
  attr_reader :name, :species 
  
  @@all = []
  
  def initialize (name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def Owner.all
    @@all 
  end
  
  def Owner.count
    @@all.length
  end
  
  def Owner.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat (cat_name)
    cat = Cat.new(cat_name, self)
  end
  def buy_dog (dog_name)
    dog = Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.dogs.each {|dog| dog.owner = nil; dog.mood = "nervous"}
    self.cats.each {|cat| cat.owner = nil; cat.mood = "nervous"}
  end
  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
  
end























