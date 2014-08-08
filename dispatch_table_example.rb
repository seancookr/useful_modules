module FoodPreparer

  #this can be used for an after_initialize in rails so calling cook_meal
  #uses the @lookup varibale, otherwise you could just substitute the dis-
  #patch_table method in its place

  def build_dispatch_table
    @lookup = {
      turkey: -> (n) { cook_turkey n },
      ham: -> (n) { cook_ham n },
      potroast: -> (n) { cook_potroast n }
    }
  end

  def cook_meal
    @lookup[meal].call years_of_experience
  end

  private

  def cook_turkey n
    puts "The Turkey was a #{n}/10"
  end

  def cook_ham n
    puts "You cooked #{n} Hams"
  end

  def cook_potroast n
    puts "the potroast took #{n} hours to cook"
  end

  #The above methods are trivial examples, but the key point is that the outputs
  #of the methods should all return the same type of object, while using differnt 
  #logic to get there.  They also should take the same # of arguments

  #For instance, if #cook_turkey takes *n, then the others should also take *n

end

class Cook
  include FoodPreparer
  attr_reader :years_of_experience, :meal

  @@possible_years_of_experience = *(1..10)

  def initialize meal
    @meal = meal
    @years_of_experience = @@possible_years_of_experience.sample
    build_dispatch_table
  end

end

c = Cook.new(:turkey)
c.cook_meal
