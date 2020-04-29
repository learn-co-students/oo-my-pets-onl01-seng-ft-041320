class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
     "I am a " + self.species + "."
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
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
  dogs = Dog.all.select {|dog| dog.owner == self}
    dogs.each do |dog|
      if dog.mood != "happy"
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    cats = Cat.all.select {|cat| cat.owner == self}
      cats.each do |cat|
        if cat.mood != "happy"
          cat.mood = "happy"
        end
      end
    end

    def sell_pets
      cats = Cat.all.select {|cat| cat.owner == self}
        cats.each do |cat|
          if cat.mood != "nervous"
            cat.mood = "nervous"
            cat.owner = nil
          end
        end

        dogs = Dog.all.select {|dog| dog.owner == self}
          dogs.each do |dog|
            if dog.mood != "nervous"
              dog.mood = "nervous"
              dog.owner = nil
            end
          end
        end

        def list_pets
          dogs = Dog.all.select {|dog| dog.owner == self}
          cats = Cat.all.select {|cat| cat.owner == self}

          "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."

        end
        
        
      end