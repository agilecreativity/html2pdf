# file: spec/fixtures/demo1.rb
# from: https://github.com/radar/guides/blob/master/gem-development/foodie/lib/foodie/food.rb
require 'active_support/inflector'
module Foodie
  class Food
    def self.portray(food)
      if food.downcase == "broccoli"
        "Gross!"
      else
        "Delicious!"
      end
    end

    def self.pluralize(word)
      word.pluralize
    end
  end
end
