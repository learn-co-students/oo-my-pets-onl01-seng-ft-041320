class Dog
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []
  def initialize(name, owner, mood = "nervous")
    @mood = mood
    @name = name
    @owner = owner
    @@all << self
  end 

  def self.all 
    @@all
  end 
end