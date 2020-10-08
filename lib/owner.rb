class Owner
  attr_reader :name, :species
  attr_accessor
  attr_writer
  @@all = []

  def initialize (name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
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

  def buy_cat(new_cat)
    new_cat = Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    new_dog = Dog.new(new_dog, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  
  end
end
